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

class NetworkingCharactersViewModel: CharactersViewModel {
    var characters = CurrentValueSubject<AsyncResult<[Character], NetworkError>, Never>(.loading)
    private var lastFetchedPage = 0
    private var cancellable: AnyCancellable?

    func loadCharacters() {
        self.characters.value = .loading
        self.cancellable = getCharacters(limit: 20, offset: 0)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.characters.value = .failed(error)
                default: break
                }
            }, receiveValue: { characters in
                self.characters.value = .finished(characters.mapToCharacters())
            })
    }
    
    func characterDidAppear(_ character: Character) {
        switch characters.value {
        case .finished(let loadedCharacters):
            let index = loadedCharacters.firstIndex { $0 == character } ?? 0
            if index >= loadedCharacters.count - 10 {
                lastFetchedPage += 1
                self.cancellable = getCharacters(limit: 20, offset: lastFetchedPage)
                    .sink(receiveCompletion: { completion in
                        switch completion {
                        case .failure(let error):
                            self.characters.value = .failed(error)
                        default: break
                        }
                    }, receiveValue: { characters in
                        var withNewItems = loadedCharacters
                        withNewItems.append(contentsOf: characters.mapToCharacters())
                        self.characters.value = .finished(withNewItems)
                    })
            }
        default: break
        }
    }
    
    func isLoading(content: () -> AnyView) -> AnyView? {
        return characters.value.isLoading(content: content)
    }
    
    func isFinished(content: ([Character]) -> AnyView) -> AnyView? {
        return characters.value.isFinished(content: content)
    }
    
    func isFailed(content: (NetworkError) -> AnyView) -> AnyView? {
        return characters.value.isFailed(content: content)
    }
}
