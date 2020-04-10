//
//  ThumbnailNetworking.swift
//  Networking
//
//  Created by Gustavo Amaral on 10/04/20.
//  Copyright © 2020 Gustavo Almeida Amaral. All rights reserved.
//

import Foundation
import UIKit
import Combine

public func getThumbnail(from url: URL, bundle: Bundle = .main, mock: NetworkResponse<Data>? = nil) -> AnyPublisher<UIImage, NetworkError> {
    return get(from: url)
        .tryMap { response -> UIImage in
            switch response {
            case let .nonEmpty(image, _):
                return image
            case .empty:
                throw NetworkError.emptyResponse
            }
        }
        .mapError { $0 as? NetworkError ?? NetworkError.unknown($0) }
        .eraseToAnyPublisher()
}
