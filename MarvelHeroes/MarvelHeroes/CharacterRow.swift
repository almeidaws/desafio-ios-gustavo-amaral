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
                Text(character.name)
            }
        }
    }
}
