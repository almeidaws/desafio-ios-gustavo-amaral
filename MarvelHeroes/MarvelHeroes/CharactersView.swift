//
//  CharactersView.swift
//  MarvelHeroes
//
//  Created by Gustavo Amaral on 10/04/20.
//  Copyright © 2020 Gustavo Almeida Amaral. All rights reserved.
//

import SwiftUI
import Networking

struct CharactersView: View {
    
    // Make no sense to set AnyCharactersViewModel as ObservableObject, the observation is made
    // by subscribing to the character publisher
    @State private var viewModel: AnyCharactersViewModel
    @State private var characters: AsyncResult<[Character], NetworkError>
    @State private var presentedCharacter: Character?
    
    init(viewModel: AnyCharactersViewModel = .default, initialCharacter: Character? = nil) {
        self._viewModel = State(initialValue: viewModel)
        self._characters = State(initialValue: viewModel.characters.value)
        self._presentedCharacter = State(initialValue: initialCharacter)
    }
    
    var body: some View {
        NavigationView {
            Section {
                characters.isFinished { characters in
                    List(characters) { character in
                        CharacterRow(character: character, presentedCharacter: self.$presentedCharacter)
                            .onAppear() { self.viewModel.characterDidAppear(character) }
                            .onTapGesture { self.presentedCharacter = character }
                    }.listStyle(GroupedListStyle())
                }
                
                characters.isLoading {
                    ActivityIndicator(style: .large)
                }
                
                characters.isFailed { networkError in
                    RetryMessage(title: "Oops…", message: networkError.localizedDescription) {
                        self.viewModel.loadCharacters()
                    }
                }
                
            }.navigationBarTitle(Text("Marvel's Characters"))
        }
        .onAppear { self.viewModel.loadCharacters() }
        .onReceive(viewModel.characters) { self.characters = $0 }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersView()
    }
}

#if DEBUG
fileprivate let testCharacters = [
    Character(id: 1, name: "Spider-Man", description: "A hero", thumbnail: .init(baseURL: URL(string: "http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16")!, extension: "jpg")),
    Character(id: 2, name: "Iron-Man", description: "Another hero", thumbnail: .init(baseURL: URL(string: "http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16")!, extension: "jpg")),
    Character(id: 3, name: "Captain America", description: "A blue hero", thumbnail: .init(baseURL: URL(string: "http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16")!, extension: "jpg"))
]
#endif
