//
//  RetryMessage.swift
//  MarvelHeroes
//
//  Created by Gustavo Amaral on 10/04/20.
//  Copyright © 2020 Gustavo Almeida Amaral. All rights reserved.
//

import Foundation
import SwiftUI

struct RetryMessage: View {
    
    let title: String
    let message: String
    let retry: () -> Void
    
    var body: some View {
        VStack {
            Text(title).font(.title)
            Text(message).font(.body)
                .multilineTextAlignment(.center)
            Spacer().frame(height: 50)
            Button(action: retry) {
                Text("Retry")
            }
        }.padding()
    }
}
