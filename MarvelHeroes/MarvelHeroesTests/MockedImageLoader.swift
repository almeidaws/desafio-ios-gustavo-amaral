//
//  MockedImageLoader.swift
//  MarvelHeroesTests
//
//  Created by Gustavo Amaral on 11/04/20.
//  Copyright © 2020 Gustavo Almeida Amaral. All rights reserved.
//

import Foundation
@testable import Marvel_s_Heroes
import Combine
import SwiftUI
import Networking

class MockedImageLoaderSubscription: Subscription {
    
    private let image: AsyncResult<UIImage, NetworkError>
    private let subscriber: AnySubscriber<AsyncResult<UIImage, NetworkError>, Never>
    
    init<S: Subscriber>(_ image: UIImage, _ subscriber: S) where S.Input == AsyncResult<UIImage, NetworkError>, S.Failure == Never {
        self.image = .finished(image)
        self.subscriber = AnySubscriber(subscriber)
    }
    
    func request(_ demand: Subscribers.Demand) {
        _ = subscriber.receive(image)
        subscriber.receive(completion: .finished)
    }
    
    func cancel() {
        fatalError("Not implemented")
    }
}

class MockedImageLoader: ImageLoader {
    
    private let image: UIImage
    
    init(image: UIImage) {
        self.image = image
    }
    
    func receive<S: Subscriber>(subscriber: S) where S.Input == AsyncResult<UIImage, NetworkError>, S.Failure == Never {
        let subscription = MockedImageLoaderSubscription(image, subscriber)
        subscriber.receive(subscription: subscription)
    }
}
