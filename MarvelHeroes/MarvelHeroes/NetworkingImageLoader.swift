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

fileprivate class ImageLoaderSubscription: Subscription {
    
    private var subscriber: AnySubscriber<AsyncResult<UIImage, NetworkError>, Never>?
    private let url: URL
    private var cancellable: AnyCancellable?
    
    init<S: Subscriber>(_ url: URL, _ subscriber: S) where S.Input == AsyncResult<UIImage, NetworkError>, S.Failure == Never {
        self.url = url
        self.subscriber = AnySubscriber(subscriber)
    }
    
    func request(_ demand: Subscribers.Demand) {
        switch demand {
        case .none: break
        default:
            guard let subscriber = self.subscriber else { return }
            self.cancellable = getThumbnail(from: url).sink(receiveCompletion: { (completion) in
                switch completion {
                case .failure(let error):
                    let nextDemand = subscriber.receive(.failed(error))
                    assert(nextDemand == .none)
                case .finished:
                    subscriber.receive(completion: .finished)
                }
            }) { (image) in
                let nextDemand = subscriber.receive(.finished(image))
                assert(nextDemand == .none)
            }
        }
    }
    
    func cancel() {
        subscriber = nil
    }
}

class NetworkingImageLoader: ImageLoader {
    
    private var subscriptions = [ImageLoaderSubscription]()
    let url: URL
    
    init(_ url: URL) {
        self.url = url
    }
    
    func receive<S: Subscriber>(subscriber: S) where S.Input == AsyncResult<UIImage, NetworkError>, S.Failure == Never {
        let subscription = ImageLoaderSubscription(url, subscriber)
        subscriber.receive(subscription: subscription)
    }
}
