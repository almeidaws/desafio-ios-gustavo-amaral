//
//  MockedCharactersViewModel.swift
//  MarvelHeroesTests
//
//  Created by Gustavo Amaral on 11/04/20.
//  Copyright © 2020 Gustavo Almeida Amaral. All rights reserved.
//

import Foundation
@testable import Marvel_Heroes
@testable import Networking
import Combine
import SwiftUI

class MockedCharactersViewModel: CharactersViewModel {
    var characters = CurrentValueSubject<AsyncResult<[Character], NetworkError>, Never>(.loading)
    
    func loadCharacters() {
        let testsBundle = Bundle(identifier: "com.almeidaws.MarvelHeroesTests")!
        let url = testsBundle.url(forResource: "characters", withExtension: "txt")!
        let data = try! Data(contentsOf: url)
        let decodedCharacters = try! JSONDecoder().decode(CommonBody<CharacterBody>.self, from: data)
        characters.value = .finished(decodedCharacters.data.results.mapToCharacters())
    }
    
    func characterDidAppear(_ character: Character) {
        // DOES NOTHING
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
