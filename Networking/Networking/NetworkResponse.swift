//
//  NetworkResponse.swift
//  networking
//
//  Created by Gustavo Amaral on 09/04/20.
//  Copyright © 2020 Gustavo Almeida Amaral. All rights reserved.
//

import Foundation

enum NetworkResponse<Body>: Hashable where Body: Hashable {
    case empty(HTTPStatusCode)
    case nonEmpty(Body, HTTPStatusCode)
    
    var status: HTTPStatusCode {
        switch self {
        case .empty(let status): return status
        case .nonEmpty(_, let status): return status
        }
    }
}
