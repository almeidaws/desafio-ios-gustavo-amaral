//
//  MostExpensiveHQViewModel.swift
//  MarvelHeroes
//
//  Created by Gustavo Amaral on 10/04/20.
//  Copyright © 2020 Gustavo Almeida Amaral. All rights reserved.
//

import Foundation
import Networking
import SwiftUI
import Combine

class MostExpensiveHQViewModel: ObservableObject {
    @Published var hq: AsyncResult<Comic?, NetworkError> = .loading
    private var cancellable: AnyCancellable?
    
    var hqTitle: String? {
        switch hq {
        case .finished(let comic): return comic?.title
        default: return nil
        }
    }
    
    func loadHQ(_ character: Character) {
        self.hq = .loading
        self.cancellable = getComics(byCharacter: "\(character.id)", limit: 100, offset: 0)
            .sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                self.hq = .failed(error)
            default: break
            }
        }) { (comics) in
            let hqs = comics.map { Comic($0) }
            self.hq = .finished(self.mostExpensive(hqs))
        }
    }
    
    private func mostExpensive(_ comics: [Comic]) -> Comic? {
        return comics.max { (firstComic, secondCommic) in
            let biggestPriceFromFirst = firstComic.prices.max { (firstPrice: Comic.Price, secondPrice: Comic.Price) in firstPrice.value < secondPrice.value }
            let biggestPriceFromSecond = secondCommic.prices.max { (firstPrice: Comic.Price, secondPrice: Comic.Price) in firstPrice.value < secondPrice.value }
            return biggestPriceFromFirst?.value ?? 0 < biggestPriceFromSecond?.value ?? 0
        } ?? comics.first
    }
}
