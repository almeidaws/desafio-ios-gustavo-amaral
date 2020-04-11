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

protocol CharactersViewModel: AnyObject, AsyncOperation where Resource == [Character], ResourceError == NetworkError {
    var characters: CurrentValueSubject<AsyncResult<[Character], NetworkError>, Never> { get set }
    func loadCharacters()
    func characterDidAppear(_ character: Character)
}

extension CharactersViewModel {
    func erased() -> AnyCharactersViewModel {
        return AnyCharactersViewModel(viewModel: self)
    }
}
