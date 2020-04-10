//
//  DeviceOrientation.swift
//  MarvelHeroes
//
//  Created by Gustavo Amaral on 10/04/20.
//  Copyright © 2020 Gustavo Almeida Amaral. All rights reserved.
//

import UIKit
import SwiftUI

struct ContainerOrientation<Content>: View where Content: View {
    let content: (Orientation) -> Content
    
    var body: some View {
        GeometryReader { geometry in
            self.content(geometry.size.width > geometry.size.height ? .landscape : .portrait)
        }
    }
    
    enum Orientation: Equatable {
        case landscape
        case portrait
    }
}
