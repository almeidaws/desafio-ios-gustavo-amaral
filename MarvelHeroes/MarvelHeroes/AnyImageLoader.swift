//
//  AnyImageLoader.swift
//  MarvelHeroes
//
//  Created by Gustavo Amaral on 11/04/20.
//  Copyright © 2020 Gustavo Almeida Amaral. All rights reserved.
//

import Foundation
import Combine
import Networking
import UIKit
import SwiftUI

class AnyImageLoader: ObservableObject, ImageLoader {
    
    let image: CurrentValueSubject<AsyncResult<UIImage, NetworkError>, Never>
    private let _loadImage: (URL) -> Void
    private let _cancelLoad: () -> Void
    
    init<Loader: ImageLoader>(loader: Loader) {
        self.image = loader.image
        self._loadImage = loader.loadImage
        self._cancelLoad = loader.cancelLoad
    }
    
    func loadImage(from url: URL) {
        _loadImage(url)
    }
    
    func cancelLoad() {
        _cancelLoad()
    }
    
    func isFinished(content: (UIImage) -> AnyView) -> AnyView? {
        return image.value.isFinished(content: content)
    }
    
    func isLoading(content: () -> AnyView) -> AnyView? {
        return image.value.isLoading(content: content)
    }
    
    func isFailed(content: (NetworkError) -> AnyView) -> AnyView? {
        return image.value.isFailed(content: content)
    }
}

extension AnyImageLoader {
    static var `default`: AnyImageLoader {
        return NetworkingImageLoader().erased()
    }
}

typealias ImageLoaderFactory = () -> AnyImageLoader

struct ImageLoaderFactoryKey: EnvironmentKey {
    static var defaultValue = { NetworkingImageLoader().erased() }
}

extension EnvironmentValues {
    var imageLoaderFactory: ImageLoaderFactory {
        get { self[ImageLoaderFactoryKey.self] }
        set { self[ImageLoaderFactoryKey.self] = newValue }
    }
}
