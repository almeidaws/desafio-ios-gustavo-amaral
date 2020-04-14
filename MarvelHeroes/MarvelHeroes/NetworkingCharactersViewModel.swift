//
//  NetworkingCharactersViewModel.swift
//  MarvelHeroes
//
//  Created by Gustavo Amaral on 11/04/20.
//  Copyright © 2020 Gustavo Almeida Amaral. All rights reserved.
//

import Foundation
import Networking
import Combine
import SwiftUI

fileprivate class NetworkingSubscription: Subscription {
    
    private var subscriber: AnySubscriber<AsyncResult<[Character], NetworkError>, Never>?
    private var cancellable: AnyCancellable?
    private var lastFetchedPage = 0
    private var currentCharacters = [Character]()
    
    init<S: Subscriber>(_ subscriber: S) where S.Input == AsyncResult<[Character], NetworkError>, S.Failure == Never {
        self.subscriber = AnySubscriber(subscriber)
    }
    
    func request(_ demand: Subscribers.Demand) {
        guard let subscriber = self.subscriber else { return }
        lastFetchedPage += 1
        self.cancellable = getCharacters(limit: 20, offset: lastFetchedPage - 1)
        .sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                let nextDemand = subscriber.receive(.failed(error))
                assert(nextDemand == .none)
            case .finished:
                break
            }
        }, receiveValue: { characters in
            let nextDemand = subscriber.receive(.finished(characters.mapToCharacters()))
            assert(nextDemand == .none)
        })
    }
    
    func cancel() {
        subscriber = nil
    }
}

class NetworkingCharactersViewModel: Publisher {
    
    typealias Output = AsyncResult<[Character], NetworkError>
    typealias Failure = Never

    func receive<S: Subscriber>(subscriber: S) where S.Input == AsyncResult<[Character], NetworkError>, S.Failure == Never {
        let subscription = NetworkingSubscription(subscriber)
        subscriber.receive(subscription: subscription)
    }
}
