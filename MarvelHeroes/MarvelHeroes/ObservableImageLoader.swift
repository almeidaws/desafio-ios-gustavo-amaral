//
//  ObservableImageLoader.swift
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

class ObservableImageLoader: ObservableObject {
    
    private var subscriber: AnySubscriber<AsyncResult<UIImage, NetworkError>, Never>?
    private var cancellable: AnyCancellable?
    @Published var image: AsyncResult<UIImage, NetworkError> = .loading
    
    init<Loader: ImageLoader>(loader: Loader) {
        self.cancellable = loader.sink { self.image = $0 }
    }
    
    func receive<S>(subscriber: S) where S : Subscriber, S.Input == AsyncResult<UIImage, NetworkError>, S.Failure == Never  {
        self.subscriber = AnySubscriber(subscriber)
    }
}

typealias ImageLoaderFactory = (URL) -> ObservableImageLoader

struct ImageLoaderFactoryKey: EnvironmentKey {
    static var defaultValue: (URL) -> ObservableImageLoader = { NetworkingImageLoader($0).erased() }
}

extension EnvironmentValues {
    var imageLoaderFactory: ImageLoaderFactory {
        get { self[ImageLoaderFactoryKey.self] }
        set { self[ImageLoaderFactoryKey.self] = newValue }
    }
}
