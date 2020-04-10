//
//  Character.swift
//  Networking
//
//  Created by Gustavo Amaral on 10/04/20.
//  Copyright © 2020 Gustavo Almeida Amaral. All rights reserved.
//

import Foundation
import Networking

struct Character: Identifiable, Hashable {
    let id: Int
    let name: String
    let description: String
    let thumbnail: Thumbnail
    
    static func == (lhs: Character, rhs: Character) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Character {
    init(_ characterBody: CharacterBody) {
        self.init(
            id: characterBody.id,
            name: characterBody.name,
            description: characterBody.description,
            thumbnail: .init(
                baseURL: characterBody.thumbnail.path,
                extension: characterBody.thumbnail.extension))
    }
}

extension Array where Element == CharacterBody {
    func mapToCharacters() -> [Character] {
        return self.map { Character($0) }
    }
}
