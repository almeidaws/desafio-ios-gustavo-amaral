//
//  MockedCharactersViewModel.swift
//  MarvelHeroesTests
//
//  Created by Gustavo Amaral on 11/04/20.
//  Copyright © 2020 Gustavo Almeida Amaral. All rights reserved.
//

import Foundation
@testable import Marvel_s_Heroes
@testable import Networking
import Combine
import SwiftUI

fileprivate class CharactersSubscription: Subscription {
    
    private let subscriber: AnySubscriber<AsyncResult<[Character], NetworkError>, Never>
    private let characters: AsyncResult<[Character], NetworkError> = .finished({
        let testsBundle = Bundle(identifier: "com.almeidaws.MarvelHeroesTests")!
        let url = testsBundle.url(forResource: "characters", withExtension: "txt")!
        let data = try! Data(contentsOf: url)
        let decodedCharacters = try! JSONDecoder().decode(CommonBody<CharacterBody>.self, from: data)
        return decodedCharacters.data.results.mapToCharacters()
    }())
    
    init<S: Subscriber>(_ subscriber: S) where S.Input == AsyncResult<[Character], NetworkError>, S.Failure == Never {
        self.subscriber = AnySubscriber(subscriber)
    }
    
    func request(_ demand: Subscribers.Demand) {
        switch demand {
        case .unlimited:
            _ = subscriber.receive(characters)
            subscriber.receive(completion: .finished)
        default:
            fatalError("Not implemented.")
        }
    }
    
    func cancel() {
        fatalError("Not implemented.")
    }
}

class MockedCharactersLoader: Publisher {
    typealias Output = AsyncResult<[Character], NetworkError>
    typealias Failure = Never
    
    func receive<S: Subscriber>(subscriber: S) where S.Input == AsyncResult<[Character], NetworkError>, S.Failure == Never {
        let subscription = CharactersSubscription(subscriber)
        subscriber.receive(subscription: subscription)
    }
}
