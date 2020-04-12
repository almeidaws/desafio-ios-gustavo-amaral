//
//  MostExpensiveHQView.swift
//  MarvelHeroes
//
//  Created by Gustavo Amaral on 10/04/20.
//  Copyright © 2020 Gustavo Almeida Amaral. All rights reserved.
//

import SwiftUI

struct MostExpensiveHQView: View {
    
    let character: Character
    @ObservedObject private var viewModel = MostExpensiveHQViewModel()
    @Environment(\.imageLoaderFactory) var imageLoaderFactory
    
    var body: some View {
        ContainerOrientation { orientation in
            GeometryReader { geometry in
                ScrollView {
                    self.viewModel.hq.isLoading {
                        Group {
                            ActivityIndicator(style: .large)
                        }.frame(width: geometry.size.width, height: geometry.size.height)
                    }
                    
                    self.viewModel.hq.isFinished { comic in
                        comic.some { comic in
                            VStack(alignment: .leading) {
                                URLImage(url: comic.thumbnail.sized(orientation == .portrait ? .portraitUncanny : .landscapeIncredible), imageLoader: self.imageLoaderFactory())
                                    .frame(maxWidth: .infinity)
                                Text(comic.biggestPriceFormatted ?? "Unknown price")
                                    .font(.largeTitle)
                                    .bold()
                                Text(comic.description ?? "Without description")
                                    .lineLimit(3)
                                    .padding(.top)
                            }.padding()
                        }
                        
                        comic.none {
                            Text("There's no HQ for that character").font(.title)
                        }
                    }
                    
                    self.viewModel.hq.isFailed { networkError in
                        RetryMessage(title: "Oops..", message: networkError.localizedDescription) {
                            self.viewModel.loadHQ(self.character)
                        }
                    }
                }
            }
        }
        .navigationBarTitle(self.viewModel.hqTitle ?? "")
        .onAppear { self.viewModel.loadHQ(self.character) }
    }
}

struct MostExpensiveHQView_Previews: PreviewProvider {
    static var previews: some View {
        MostExpensiveHQView(character: testCharacter2)
    }
}

let testCharacter2 = Character(id: 1011334, name: "Spider-Man", description: "A hero", thumbnail: .init(baseURL: URL(string: "http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16")!, extension: "jpg"))
