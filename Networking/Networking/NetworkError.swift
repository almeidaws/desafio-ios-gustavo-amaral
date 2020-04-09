//
//  NetworkError.swift
//  networking
//
//  Created by Gustavo Amaral on 09/04/20.
//  Copyright © 2020 Gustavo Almeida Amaral. All rights reserved.
//

import Foundation

enum NetworkError: Error, Hashable, CustomStringConvertible {
    case withoutResponse
    case emptyResponse
    case dependency(Error)
    case decoding(Error)
    case unknown(Error)
    
    var description: String {
        switch self {
        case .withoutResponse: return "Without response from the request."
        case .emptyResponse: return "The network response is empty."
        case .dependency(let error): return "Dependency: \(error.localizedDescription)"
        case .decoding(let error): return "Decoding: \(error.localizedDescription)"
        case .unknown(let error): return "Unknown: \(error.localizedDescription)"
        }
    }
    
    static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
        return lhs.localizedDescription == rhs.localizedDescription
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.localizedDescription)
    }
}
