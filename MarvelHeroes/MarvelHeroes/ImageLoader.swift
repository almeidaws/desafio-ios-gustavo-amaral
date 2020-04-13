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

protocol ImageLoader: Publisher where Output == AsyncResult<UIImage, NetworkError>, Failure == Never { }


extension ImageLoader {
    func erased() -> ObservableImageLoader {
        return ObservableImageLoader(loader: self)
    }
}
