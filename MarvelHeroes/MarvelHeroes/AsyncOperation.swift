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
    
    func isFinished<Content: View>(@ViewBuilder content: (Resource) -> Content) -> Content?
    func isLoading<Content: View>(@ViewBuilder content: () -> Content) -> Content?
    func isFailed<Content: View>(@ViewBuilder content: (ResourceError) -> Content) -> Content?
}
