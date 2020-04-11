//
//  AsyncOperation.swift
//  MarvelHeroes
//
//  Created by Gustavo Amaral on 10/04/20.
//  Copyright © 2020 Gustavo Almeida Amaral. All rights reserved.
//

import Foundation
import SwiftUI

protocol AsyncOperation {
    
    associatedtype Resource
    associatedtype ResourceError: Error
    
    func isFinished(@ViewBuilder content: (Resource) -> AnyView) -> AnyView?
    func isLoading(@ViewBuilder content: () -> AnyView) -> AnyView?
    func isFailed(@ViewBuilder content: (ResourceError) -> AnyView) -> AnyView?
}
