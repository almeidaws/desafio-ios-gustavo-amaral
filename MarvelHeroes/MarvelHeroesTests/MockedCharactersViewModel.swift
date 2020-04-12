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
    let characters = CurrentValueSubject<AsyncResult<[Character], NetworkError>, Never>(.finished({
        let testsBundle = Bundle(identifier: "com.almeidaws.MarvelHeroesTests")!
        let url = testsBundle.url(forResource: "characters", withExtension: "txt")!
        let data = try! Data(contentsOf: url)
        let decodedCharacters = try! JSONDecoder().decode(CommonBody<CharacterBody>.self, from: data)
        return decodedCharacters.data.results.mapToCharacters()
    }()))
    
    func loadCharacters() {
        // DOES NOTHING
    }
    
    func characterDidAppear(_ character: Character) {
        // DOES NOTHING
    }
    
    func isLoading(content: () -> AnyView) -> AnyView? {
        return nil
    }
    
    func isFinished(content: ([Character]) -> AnyView) -> AnyView? {
        return characters.value.isFinished(content: content)
    }
    
    func isFailed(content: (NetworkError) -> AnyView) -> AnyView? {
        return nil
    }
}
