//
//  Thumbnail.swift
//  MarvelHeroes
//
//  Created by Gustavo Amaral on 10/04/20.
//  Copyright © 2020 Gustavo Almeida Amaral. All rights reserved.
//

import Foundation

struct Thumbnail {
    let baseURL: URL
    let `extension`: String
    
    enum Size: String {
        case standardSmall = "standard_small"
        case portraitUncanny = "portrait_uncanny"
        case landscapeIncredible = "landscape_incredible"
    }
    
    func sized(_ size: Size) -> URL {
        return baseURL
            .appendingPathComponent("\(size.rawValue).\(`extension`)")
    }
}
