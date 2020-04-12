//
//  NetworkingImageLoader.swift
//  MarvelHeroes
//
//  Created by Gustavo Amaral on 11/04/20.
//  Copyright © 2020 Gustavo Almeida Amaral. All rights reserved.
//

import Foundation
import Combine
import UIKit
import Networking
import SwiftUI

class NetworkingImageLoader: ImageLoader {
    
    var image = CurrentValueSubject<AsyncResult<UIImage, NetworkError>, Never>(.loading)
    private var cancellable: AnyCancellable?
    
    func loadImage(from url: URL) {
        self.image.value = .loading
        self.cancellable = getThumbnail(from: url)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.image.value = .failed(error)
                    debugPrint(error.localizedDescription)
                default: break
                }
            }, receiveValue: { response in
                self.image.value = .finished(response)
        })
    }
    
    func cancelLoad() {
        self.cancellable?.cancel()
    }
    
    func isFinished(@ViewBuilder content: (UIImage) -> AnyView) -> AnyView? {
        return image.value.isFinished(content: content)
    }
    
    func isLoading(@ViewBuilder content: () -> AnyView) -> AnyView? {
        return image.value.isLoading(content: content)
    }
    
    func isFailed(@ViewBuilder content: (NetworkError) -> AnyView) -> AnyView? {
        return image.value.isFailed(content: content)
    }
}
