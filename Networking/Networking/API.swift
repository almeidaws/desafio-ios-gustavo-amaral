//
//  API.swift
//  Networking
//
//  Created by Gustavo Amaral on 10/04/20.
//  Copyright © 2020 Gustavo Almeida Amaral. All rights reserved.
//

import Foundation

enum API { }

fileprivate enum InfoPListKey: String {
    case marvelAPIKey = "MARVEL_API_KEY"
    case host = "MARVEL_HOST_URL"
}

extension API {
    private static func host(_ bundle: Bundle = .main) -> URL {
        guard let path = bundle.object(forInfoDictionaryKey: InfoPListKey.host.rawValue) as? String else {
            fatalError("The API base URL is not a string.")
        }
        guard let url = URL(string: path) else {
            fatalError("The API base URL is not valid.")
        }
        return url
    }
    
    static func key(_ bundle: Bundle = .main) -> String {
        guard let apiKey = bundle.object(forInfoDictionaryKey: InfoPListKey.marvelAPIKey.rawValue) as? String else {
            fatalError("Marvel API Key not found on bundle \(bundle)")
        }
        return apiKey
    }
    
    static func characters(_ bundle: Bundle = .main) -> URL {
        return host(bundle)
            .appendingPathComponent("v1")
            .appendingPathComponent("public")
            .appendingPathComponent("characters")
    }
}
