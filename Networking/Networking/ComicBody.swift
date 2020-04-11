//
//  ComicBody.swift
//  Networking
//
//  Created by Gustavo Amaral on 10/04/20.
//  Copyright © 2020 Gustavo Almeida Amaral. All rights reserved.
//

import Foundation

public struct ComicBody: Decodable, Hashable {
    public let id: Int
    public let title: String
    public let description: String?
    public let thumbnail: CharacterBody.Thumbnail
    public let prices: [Price]
    
    public struct Price: Decodable, Hashable {
        public let type: PriceType
        public let price: Double
        
        public enum PriceType: String, Decodable {
            case printPrice
            case digitalPurchasePrice
        }
    }
    
    public struct Thumbnail: Decodable, Hashable {
        let path: URL
    }
}
