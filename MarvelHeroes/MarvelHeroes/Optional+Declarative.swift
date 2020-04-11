//
//  Optional+Declarative.swift
//  MarvelHeroes
//
//  Created by Gustavo Amaral on 10/04/20.
//  Copyright © 2020 Gustavo Almeida Amaral. All rights reserved.
//

import Foundation
import SwiftUI

extension Optional {
    func some<Content: View>(@ViewBuilder content: (Wrapped) -> Content) -> Content? {
        switch self {
        case .some(let wrapped): return content(wrapped)
        default: return nil
        }
    }
    
    func none<Content: View>(@ViewBuilder content: () -> Content) -> Content? {
        switch self {
        case .none: return content()
        default: return nil
        }
    }
}
