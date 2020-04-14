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
    @Binding var presentedCharacter: Character?
    @State private var isActive = false
    @Environment(\.imageLoaderFactory) private var imageLoaderFactory
    
    var body: some View {
        NavigationLink(destination: DetailedCharacterView(character: character), isActive: self.$isActive) {
            HStack {
                URLImage(imageLoader: imageLoaderFactory(character.thumbnail.sized(.standardSmall)))
                    .frame(width: 65, height: 45, alignment: .center)
                    .padding(.trailing)
                Text(character.name)
            }.onAppear { if self.character == self.presentedCharacter { self.isActive = true } }
        }
    }
}
