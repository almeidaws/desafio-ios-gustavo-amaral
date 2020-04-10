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
    
    var body: some View {
        NavigationLink(destination: CharactersView()) {
            HStack {
                URLImage(url: character.thumbnail.sized(.standardSmall))
                    .frame(width: 65, height: 45, alignment: .center)
                    .padding(.trailing)
                Text(character.name)
            }
        }
    }
}
