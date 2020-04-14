//
//  CharactersViewModel.swift
//  MarvelHeroes
//
//  Created by Gustavo Amaral on 10/04/20.
//  Copyright © 2020 Gustavo Almeida Amaral. All rights reserved.
//

import Foundation
import Networking
import SwiftUI
import Combine

class CharactersViewModel: ObservableObject, Subscriber {
    
    private var subscription: Subscription?
    @Published var characters: AsyncResult<[Character], NetworkError> = .loading
    
    init<P: Publisher>(_ loader: P) where P.Output == AsyncResult<[Character], NetworkError>, P.Failure == Never {
        loader.subscribe(self)
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
        // DOES NOTHING
    }
    
    func receive(subscription: Subscription) {
        self.subscription = subscription
        subscription.request(.unlimited)
    }
    
    func receive(_ input: AsyncResult<[Character], NetworkError>) -> Subscribers.Demand {
        switch self.characters {
        case .finished(let characters):
            switch input {
            case .finished(let otherCharacters):
                var moreCharacters = characters
                moreCharacters.append(contentsOf: otherCharacters)
                self.characters = .finished(moreCharacters)
            default:
                self.characters = input
            }
        default:
            self.characters = input
        }
        return .none
    }
    
    func retry() {
        subscription?.request(.unlimited)
    }
    
    func characterDidAppear(_ character: Character) {
        switch characters {
        case .finished(let characters):
            let index = characters.lastIndex { $0 == character } ?? 0
            if index >= characters.count - 12 {
                subscription?.request(.unlimited)
            }
        default: break
        }
    }
}

private extension AsyncResult where Resource == [Character], ResourceError == NetworkError {
    var characters: [Character] {
        switch self {
        case .finished(let characters):
            return characters
        default: return []
        }
    }
}

extension CharactersViewModel {
    static var `default`: CharactersViewModel {
        return CharactersViewModel(NetworkingCharactersViewModel())
    }
}
