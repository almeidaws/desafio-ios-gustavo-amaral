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
    
    @ObservedObject private var viewModel: AnyCharactersViewModel
    @State private var characters: AsyncResult<[Character], NetworkError> = .loading
    
    init(viewModel: AnyCharactersViewModel = .default) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            Section {
                characters.isFinished { characters in
                    List(characters) { character in
                        CharacterRow(character: character)
                            .onAppear() { self.viewModel.characterDidAppear(character) }
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
