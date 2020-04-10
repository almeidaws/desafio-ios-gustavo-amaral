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

class CharactersViewModel: ObservableObject, AsyncOperation {
    @Published var characters: AsyncResult<[Character], NetworkError> = .loading
    private var lastFetchedPage = 0
    private var cancellable: AnyCancellable?
    
    func loadCharacters() {
        self.characters = .loading
        self.cancellable = getCharacters(limit: 20, offset: 0)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.characters = .failed(error)
                default: break
                }
            }, receiveValue: { characters in
                self.characters = .finished(characters.mapToCharacters())
            })
    }
    
    func characterDidAppear(_ character: Character) {
        switch characters {
        case .finished(let loadedCharacters):
            let index = loadedCharacters.firstIndex { $0 == character } ?? 0
            if index >= loadedCharacters.count - 10 {
                lastFetchedPage += 1
                self.cancellable = getCharacters(limit: 20, offset: lastFetchedPage)
                    .sink(receiveCompletion: { completion in
                        switch completion {
                        case .failure(let error):
                            self.characters = .failed(error)
                        default: break
                        }
                    }, receiveValue: { characters in
                        var withNewItems = loadedCharacters
                        withNewItems.append(contentsOf: characters.mapToCharacters())
                        self.characters = .finished(withNewItems)
                    })
            }
        default: break
        }
    }
    
    func isLoading<Content>(content: () -> Content) -> Content? where Content : View {
        return characters.isLoading(content: content)
    }
    
    func isFinished<Content>(content: ([Character]) -> Content) -> Content? where Content : View {
        return characters.isFinished(content: content)
    }
    
    func isFailed<Content>(content: (NetworkError) -> Content) -> Content? where Content : View {
        return characters.isFailed(content: content)
    }
}
