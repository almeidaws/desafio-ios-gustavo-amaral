//
//  CharacterNetworking.swift
//  Networking
//
//  Created by Gustavo Amaral on 09/04/20.
//  Copyright © 2020 Gustavo Almeida Amaral. All rights reserved.
//

import Foundation
import Combine

public func getCharacters(limit: Int, offset: Int, bundle: Bundle = .main, mock: NetworkResponse<Data>? = nil) -> AnyPublisher<[CharacterBody], NetworkError> {
    let publisher: AnyPublisher<NetworkResponse<CommonBody<CharacterBody>>, NetworkError> = get(from: API.characters(bundle), queryParameters: [
        "limit": limit,
        "offset": offset,
        "apikey": API.key(bundle),
    ], headers: [
        "Referer" : Bundle.main.bundleIdentifier ?? ""
    ], mock: mock)
    
    return publisher
        .tryMap { response -> CommonBody<CharacterBody> in
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
