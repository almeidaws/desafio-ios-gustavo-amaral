//
//  MostExpensiveHQButton.swift
//  MarvelHeroes
//
//  Created by Gustavo Amaral on 10/04/20.
//  Copyright © 2020 Gustavo Almeida Amaral. All rights reserved.
//

import SwiftUI

// Could be generalized if there's more buttons like this on the project...
struct MostExpensiveHQButton: View {
    let character: Character
    
    var body: some View {
        HStack {
            NavigationLink(destination: MostExpensiveHQView(character: character)) {
                HStack {
                    Image(systemName: "book")
                        .font(.body)
                    Text("Most expensive HQ")
                        .fontWeight(.semibold)
                        .font(.body)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(LinearGradient(gradient: Gradient(colors: [Color.accentColor, Color.secondary]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(40)
            }.padding(.vertical, 20)
        }
    }
}
