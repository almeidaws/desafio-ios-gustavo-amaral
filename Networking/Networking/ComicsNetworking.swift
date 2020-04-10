//
//  ComicsNetworking.swift
//  Networking
//
//  Created by Gustavo Amaral on 10/04/20.
//  Copyright © 2020 Gustavo Almeida Amaral. All rights reserved.
//

import Foundation
import Combine

public func getComics(byCharacter character: String, limit: Int, offset: Int, bundle: Bundle = .main, mock: NetworkResponse<Data>? = nil) -> AnyPublisher<[ComicBody], NetworkError> {
    let publisher: AnyPublisher<NetworkResponse<CommonBody<ComicBody>>, NetworkError> = get(from: API.comics(byCharacter: character, bundle), queryParameters: [
        "limit": limit,
        "offset": offset,
        "apikey": API.key(bundle)
    ], headers: [
        "Referer" : Bundle.main.bundleIdentifier ?? ""
    ], mock: mock)
    
    return publisher
        .tryMap { response -> CommonBody<ComicBody> in
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
