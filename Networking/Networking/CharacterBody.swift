//
//  CharacterBody.swift
//  Networking
//
//  Created by Gustavo Amaral on 10/04/20.
//  Copyright © 2020 Gustavo Almeida Amaral. All rights reserved.
//

import Foundation

public struct CharacterBody: Decodable, Hashable {
    public let id: Int
    public let name: String
    public let description: String
    public let thumbnail: Thumbnail
    
    public struct Thumbnail: Decodable, Hashable {
        public let path: URL
        public let `extension`: String
    }
}
