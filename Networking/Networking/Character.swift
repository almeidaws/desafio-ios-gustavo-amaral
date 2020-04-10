//
//  Character.swift
//  Networking
//
//  Created by Gustavo Amaral on 10/04/20.
//  Copyright © 2020 Gustavo Almeida Amaral. All rights reserved.
//

import Foundation

struct Character: Decodable, Hashable {
    let id: Int
    let name: String
    let description: String
    let thumbnail: Thumbnail
    
    struct Thumbnail: Decodable, Hashable {
        let path: String
    }
}
