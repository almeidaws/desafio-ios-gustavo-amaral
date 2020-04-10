//
//  CharacterNetworking.swift
//  Networking
//
//  Created by Gustavo Amaral on 09/04/20.
//  Copyright © 2020 Gustavo Almeida Amaral. All rights reserved.
//

import Foundation
import Combine

func getCharacters(limit: Int, offset: Int, bundle: Bundle = .main, mock: NetworkResponse<Data>? = nil) -> AnyPublisher<[Character], NetworkError> {
    let publisher: AnyPublisher<NetworkResponse<CommonBody<Character>>, NetworkError> = get(from: API.characters(bundle), queryParameters: [
        "limit": limit,
        "offset": offset,
        "apiKey": API.key(bundle)
    ], mock: mock)
    
    return publisher
        .tryMap { response -> CommonBody<Character> in
            switch response {
            case let .nonEmpty(commonBody, _):
                return commonBody
            case .empty:
                throw NetworkError.emptyResponse
            }
        }
        .map { $0.data.results }
        .mapError { $0 as? NetworkError ?? NetworkError.unknown($0) }
        .eraseToAnyPublisher()
}
