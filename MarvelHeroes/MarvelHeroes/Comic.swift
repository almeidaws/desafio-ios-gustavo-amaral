//
//  Comic.swift
//  Networking
//
//  Created by Gustavo Amaral on 10/04/20.
//  Copyright © 2020 Gustavo Almeida Amaral. All rights reserved.
//

import Foundation
import Networking

struct Comic: Identifiable {
    let id: Int
    let title: String
    let description: String?
    let thumbnail: Thumbnail
    let prices: [Price]
    
    var biggestPriceFormatted: String? {
        let biggest = prices.max { (firstPrice, secondPrice) in
            return firstPrice.value < secondPrice.value
        } ?? prices.first
        return biggest?.formattedValue
    }
    
    struct Price {
        let type: PriceType
        let value: Double
        
        var formattedValue: String? {
            let formatter = NumberFormatter()
            formatter.usesGroupingSeparator = true
            formatter.numberStyle = .currency
            formatter.locale = Locale(identifier: "en_US")
            return formatter.string(from: NSNumber(value: value))
        }
        
        enum PriceType {
            case printPrice
            case digitalPurchasePrice
        }
    }
}

extension Comic {
    init(_ comicBody: ComicBody) {
        self.init(
            id: comicBody.id,
            title: comicBody.title,
            description: comicBody.description,
            thumbnail: .init(
                baseURL: comicBody.thumbnail.path,
                extension: comicBody.thumbnail.extension),
            prices: comicBody.prices.mapToPrices())
    }
}

extension Array where Element == ComicBody.Price {
    func mapToPrices() -> [Comic.Price] {
        return self.map { Comic.Price(type: $0.type.asType, value: $0.price) }
    }
}

extension ComicBody.Price.PriceType {
    var asType: Comic.Price.PriceType {
        switch self {
        case .printPrice: return .printPrice
        case .digitalPurchasePrice: return .digitalPurchasePrice
        }
    }
}
