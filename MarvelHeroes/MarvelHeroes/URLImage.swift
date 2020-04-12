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
    @State private var imageLoader: AnyImageLoader
    @State private var isPresentingError = false
    @State private var isHidden = true
    @State private var image: AsyncResult<UIImage, NetworkError>
    
    init(url: URL, imageLoader: AnyImageLoader) {
        self.url = url
        self._imageLoader = State(initialValue: imageLoader)
        self._image = State(initialValue: imageLoader.image.value)
    }
    
    var body: some View {
        Group {
            image.isLoading {
                AnyView(
                    ActivityIndicator(style: .medium)
                    .opacity(isHidden ? 1 : 0)
                    .animation(.easeInOut)
                )
            }
            
            image.isFinished { image in
                AnyView(
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                        .opacity(isHidden ? 0 : 1)
                        .onAppear { withAnimation { self.isHidden = false } }
                        .onDisappear { withAnimation { self.isHidden = true } }
                )
            }
            
            image.isFailed { _ in
                AnyView(
                    Image(systemName: "xmark.octagon")
                        .opacity(isHidden ? 1 : 0)
                        .animation(.easeInOut)
                )
            }

        }
        .onAppear { self.imageLoader.loadImage(from: self.url) }
        .onReceive(imageLoader.image) { self.image = $0 }
        
        
    }
}





