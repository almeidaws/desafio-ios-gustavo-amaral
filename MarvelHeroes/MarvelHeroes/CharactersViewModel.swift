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
