//
//  ImageLoader.swift
//  MarvelHeroes
//
//  Created by Gustavo Amaral on 11/04/20.
//  Copyright © 2020 Gustavo Almeida Amaral. All rights reserved.
//

import Foundation
import Combine
import Networking
import UIKit
import SwiftUI

protocol ImageLoader: AsyncOperation where Resource == UIImage, ResourceError == NetworkError {
    var image: CurrentValueSubject<AsyncResult<UIImage, NetworkError>, Never> { get }
    func loadImage(from url: URL)
    func cancelLoad()
}

extension ImageLoader {
    func erased() -> AnyImageLoader {
        return AnyImageLoader(loader: self)
    }
}
