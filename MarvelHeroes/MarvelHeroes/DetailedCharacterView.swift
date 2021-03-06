//
//  DetailedCharacterView.swift
//  MarvelHeroes
//
//  Created by Gustavo Amaral on 10/04/20.
//  Copyright © 2020 Gustavo Almeida Amaral. All rights reserved.
//

import SwiftUI

struct DetailedCharacterView: View {
    
    let character: Character
    @Environment(\.imageLoaderFactory) private var imageLoaderFactory
    
    var body: some View {
        ContainerOrientation { orientation in
            ScrollView {
                VStack {
                    URLImage(imageLoader: self.imageLoaderFactory(self.character.thumbnail.sized(orientation == .portrait ? .portraitUncanny : .landscapeIncredible)))
                    
                    Text(self.character.description)
                        .font(.body)
                        .lineLimit(3)
                        .padding(.top)
                        .multilineTextAlignment(.leading)
                    MostExpensiveHQButton(character: self.character)
                }
            }.padding(.horizontal)
        }
        .navigationBarTitle(character.name)
    }
}

struct DetailedCharacterView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedCharacterView(character: testCharacter1)
    }
}

fileprivate let testCharacter1 = Character(id: 1, name: "Spider-Man", description: "A hero", thumbnail: .init(baseURL: URL(string: "http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16")!, extension: "jpg"))
