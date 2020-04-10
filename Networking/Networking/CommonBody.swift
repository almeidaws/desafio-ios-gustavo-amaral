//
//  CommonBody.swift
//  Networking
//
//  Created by Gustavo Amaral on 10/04/20.
//  Copyright © 2020 Gustavo Almeida Amaral. All rights reserved.
//

import Foundation

struct CommonBody<Body>: Decodable, Hashable where Body: Decodable & Hashable {
    let data: Data
    
    struct Data: Decodable, Hashable {
        let results: [Body]
    }
}
