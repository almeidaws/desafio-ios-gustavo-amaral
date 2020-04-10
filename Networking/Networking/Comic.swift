//
//  Comic.swift
//  Networking
//
//  Created by Gustavo Amaral on 10/04/20.
//  Copyright © 2020 Gustavo Almeida Amaral. All rights reserved.
//

import Foundation

struct Comic: Decodable, Hashable {
    let id: Int
    let title: String
    let description: String?
    let thumbnail: Thumbnail
    let prices: [Price]
    
    struct Price: Decodable, Hashable {
        let type: String
        let price: Double
        
        enum PriceType {
            case printPrice
            case digitalPurchasePrice
        }
    }
    
    struct Thumbnail: Decodable, Hashable {
        let path: URL
    }
}
