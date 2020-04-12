//
//  MockedImageLoader.swift
//  MarvelHeroesTests
//
//  Created by Gustavo Amaral on 11/04/20.
//  Copyright © 2020 Gustavo Almeida Amaral. All rights reserved.
//

import Foundation
@testable import Marvel_Heroes
import Combine
import SwiftUI
import Networking

class MockedImageLoader: ImageLoader {
    
    let image: CurrentValueSubject<AsyncResult<UIImage, NetworkError>, Never>
    
    init(image: UIImage) {
        self.image = CurrentValueSubject(.finished(image))
    }
    
    func loadImage(from url: URL) {
        // DOES NOTHING
    }
    
    func cancelLoad() {
        // DOES NOTHING
    }
    
    func isFinished(content: (UIImage) -> AnyView) -> AnyView? {
        return image.value.isFinished(content: content)
    }
    
    func isLoading(content: () -> AnyView) -> AnyView? {
        return nil
    }
    
    func isFailed(content: (NetworkError) -> AnyView) -> AnyView? {
        return nil
    }
}
