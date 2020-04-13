//
//  CharacterRow.swift
//  MarvelHeroes
//
//  Created by Gustavo Amaral on 10/04/20.
//  Copyright © 2020 Gustavo Almeida Amaral. All rights reserved.
//

import Foundation
import SwiftUI

struct CharacterRow: View {
    let character: Character
    @Environment(\.imageLoaderFactory) private var imageLoaderFactory
    var presentedCharacter: Binding<Character?>
    
    var body: some View {
        NavigationLink(destination: DetailedCharacterView(character: character), tag: character, selection: presentedCharacter) {
//        NavigationLink(destination: DetailedCharacterView(character: character), isActive: isActive) {
            HStack {
                URLImage(imageLoader: imageLoaderFactory(character.thumbnail.sized(.standardSmall)))
//                URLImage(url: character.thumbnail.sized(.standardSmall), imageLoader: imageLoaderFactory())
                    .frame(width: 65, height: 45, alignment: .center)
                    .padding(.trailing)
                Text(character.name)
            }
        }
    }
}
