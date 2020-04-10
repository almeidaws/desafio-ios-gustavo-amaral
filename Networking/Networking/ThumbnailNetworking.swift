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
}
