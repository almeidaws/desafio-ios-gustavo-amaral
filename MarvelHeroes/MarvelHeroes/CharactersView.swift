//
//  CharactersView.swift
//  MarvelHeroes
//
//  Created by Gustavo Amaral on 10/04/20.
//  Copyright © 2020 Gustavo Almeida Amaral. All rights reserved.
//

import SwiftUI

struct CharactersView: View {
    
    @ObservedObject var viewModel = CharactersViewModel()
    @State var page = 0
    
    var body: some View {
        NavigationView {
            Section {
                viewModel.characters.isFinished { characters in
                    List(characters) { character in
                        CharacterRow(character: character)
                    }.listStyle(GroupedListStyle())
                }
                
                viewModel.characters.isLoading {
                    ActivityIndicator(style: .large)
                }
                
                viewModel.characters.isFailed { networkError in
                    RetryMessage(title: "Oops…", message: networkError.localizedDescription) {
                        self.viewModel.loadCharacters()
                    }
                }
                
            }.navigationBarTitle(Text("Marvel's Characters"))
            }.onAppear { self.viewModel.loadCharacters() }
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
