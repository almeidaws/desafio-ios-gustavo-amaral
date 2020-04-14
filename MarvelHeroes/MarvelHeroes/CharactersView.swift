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
    
    @ObservedObject private var viewModel: CharactersViewModel
    @State private var presentedCharacter: Character? = nil
    @State private var initialCharacter: Character?
    
    init(viewModel: CharactersViewModel = .default, initialCharacter: Character? = nil) {
        self.viewModel = viewModel
        self._presentedCharacter = State(initialValue: initialCharacter)
    }
    
    var body: some View {
        NavigationView {
            Section {
                viewModel.characters.whenFinished { characters in
                    List(characters) { character in
                        CharacterRow(character: character, presentedCharacter: self.$presentedCharacter)
                            .onAppear() { self.viewModel.characterDidAppear(character) }
                    }.listStyle(GroupedListStyle())
                }
                
                viewModel.characters.whenLoading {
                    ActivityIndicator(style: .large)
                }
                
                viewModel.characters.whenFailed { networkError in
                    RetryMessage(title: "Oops…", message: networkError.localizedDescription) {
                        self.viewModel.retry()
                    }
                }
                
            }.navigationBarTitle(Text("Marvel's Characters"))
        }
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
