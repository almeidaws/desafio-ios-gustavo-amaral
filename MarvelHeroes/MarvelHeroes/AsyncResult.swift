//
//  AsyncResult.swift
//  MarvelHeroes
//
//  Created by Gustavo Amaral on 10/04/20.
//  Copyright © 2020 Gustavo Almeida Amaral. All rights reserved.
//

import Foundation
import SwiftUI

enum AsyncResult<Resource, ResourceError>: AsyncOperation where ResourceError: Error {
    case finished(Resource)
    case loading
    case failed(ResourceError)
    
    func isFinished<Content: View>(@ViewBuilder content: (Resource) -> Content) -> Content? {
        switch self {
        case .finished(let resource): return content(resource)
        default: return nil
        }
    }
    
    func isLoading<Content: View>(@ViewBuilder content: () -> Content) -> Content? {
        switch self {
        case .loading: return content()
        default: return nil
        }
    }
    
    func isFailed<Content: View>(@ViewBuilder content: (ResourceError) -> Content) -> Content? {
        switch self {
        case .failed(let error): return content(error)
        default: return nil
        }
    }
}
