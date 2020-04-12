//
//  AnyCharactersViewModel.swift
//  MarvelHeroes
//
//  Created by Gustavo Amaral on 11/04/20.
//  Copyright © 2020 Gustavo Almeida Amaral. All rights reserved.
//

import Foundation
import SwiftUI
import Networking
import Combine

class AnyCharactersViewModel: ObservableObject, CharactersViewModel {
    let characters: CurrentValueSubject<AsyncResult<[Character], NetworkError>, Never>
    
    private let _loadCharacters: () -> Void
    private let _characterDidAppear: (Character) -> Void
    private let _isFinished: (([Character]) -> AnyView) -> AnyView?
    private let _isFailed: ((NetworkError) -> AnyView) -> AnyView?
    private let _isLoading: (() -> AnyView) -> AnyView?
    
    var ab: AnyCancellable?
    init<ViewModel: CharactersViewModel>(viewModel: ViewModel) {
        self.characters = viewModel.characters
        self._loadCharacters = viewModel.loadCharacters
        self._characterDidAppear = viewModel.characterDidAppear
        self._isFinished = viewModel.isFinished
        self._isLoading = viewModel.isLoading
        self._isFailed = viewModel.isFailed
    }
    
    func loadCharacters() {
        _loadCharacters()
    }
    
    func characterDidAppear(_ character: Character) {
        _characterDidAppear(character)
    }
    
    func isFinished(content: ([Character]) -> AnyView) -> AnyView? {
        return _isFinished(content)
    }
    
    func isLoading(content: () -> AnyView) -> AnyView? {
        return _isLoading(content)
    }
    
    func isFailed(content: (NetworkError) -> AnyView) -> AnyView? {
        return _isFailed(content)
    }
}

extension AnyCharactersViewModel {
    static var `default`: AnyCharactersViewModel {
        return NetworkingCharactersViewModel().erased()
    }
}
