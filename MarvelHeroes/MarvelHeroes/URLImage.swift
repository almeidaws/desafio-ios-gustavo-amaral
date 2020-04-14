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
    
    @ObservedObject private var imageLoader: ObservableImageLoader
    @State private var isHidden = true
    @Environment(\.isURLImageAnimationEnabled) private var isAnimationEnabled
    
    init(imageLoader: ObservableImageLoader){
        self.imageLoader = imageLoader
    }
    
    var body: some View {
        Group {
            imageLoader.image.isLoading {
                AnyView(
                    ActivityIndicator(style: .medium)
                    .opacity(isHidden ? 1 : 0)
                    .animation(.easeInOut)
                )
            }
            
            imageLoader.image.isFinished { image in
                AnyView(
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .cornerRadius(10)
                        .opacity(isAnimationEnabled && isHidden ? 0 : 1)
                        .onAppear { if self.isAnimationEnabled { withAnimation { self.isHidden = false } } }
                        .onDisappear { if self.isAnimationEnabled { withAnimation { self.isHidden = true } } }
                )
            }
            
            imageLoader.image.isFailed { _ in
                AnyView(
                    Image(systemName: "xmark.octagon")
                        .opacity(isHidden ? 1 : 0)
                        .animation(.easeInOut)
                )
            }
        }
    }
}

struct URLImageAnimationKey: EnvironmentKey {
    static var defaultValue: Bool {
        return true
    }
}

extension EnvironmentValues {
    var isURLImageAnimationEnabled: Bool {
        get { self[URLImageAnimationKey] }
        set { self[URLImageAnimationKey] = newValue }
    }
}
