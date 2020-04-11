//
//  URLImage.swift
//  MarvelHeroes
//
//  Created by Gustavo Amaral on 10/04/20.
//  Copyright © 2020 Gustavo Almeida Amaral. All rights reserved.
//

import SwiftUI
import Networking
import Combine

struct URLImage: View {
    
    let url: URL
    @ObservedObject private var imageLoader = ImageLoader()
    @State private var isPresentingError = false
    @State private var isHidden = true
    
    var body: some View {
        Group {
            imageLoader.isLoading {
                ActivityIndicator(style: .medium)
                    .opacity(isHidden ? 1 : 0)
                    .animation(.easeInOut)
            }
            
            imageLoader.isFinished { image in
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .opacity(isHidden ? 0 : 1)
                    .onAppear { withAnimation { self.isHidden = false } }
                    .onDisappear { withAnimation { self.isHidden = true } }
            }
            
            imageLoader.isFailed { _ in
                Image(systemName: "xmark.octagon")
                    .opacity(isHidden ? 1 : 0)
                    .animation(.easeInOut)
            }

        }
        .onAppear { self.imageLoader.loadImage(from: self.url) }
    }
}

fileprivate class ImageLoader: ObservableObject, AsyncOperation {
    
    @Published private var image: AsyncResult<UIImage, NetworkError> = .loading
    private var cancellable: AnyCancellable?
    
    func loadImage(from url: URL) {
        self.image = .loading
        self.cancellable = getThumbnail(from: url)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.image = .failed(error)
                    debugPrint(error.localizedDescription)
                default: break
                }
            }, receiveValue: { response in
                self.image = .finished(response)
        })
    }
    
    func cancelLoad() {
        self.cancellable?.cancel()
    }
    
    func isFinished<Content: View>(@ViewBuilder content: (UIImage) -> Content) -> Content? {
        return image.isFinished(content: content)
    }
    
    func isLoading<Content: View>(@ViewBuilder content: () -> Content) -> Content? {
        return image.isLoading(content: content)
    }
    
    func isFailed<Content: View>(@ViewBuilder content: (NetworkError) -> Content) -> Content? {
        return image.isFailed(content: content)
    }
}
