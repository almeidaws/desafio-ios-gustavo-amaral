//
//  MarvelHeroesTests.swift
//  MarvelHeroesTests
//
//  Created by Gustavo Amaral on 11/04/20.
//  Copyright © 2020 Gustavo Almeida Amaral. All rights reserved.
//

import XCTest
@testable import Marvel_Heroes
import SnapshotTesting
import SwiftUI
@testable import Networking

class MarvelHeroesTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCharactersListing() throws {
        record = true
        let view = CharactersView(viewModel: MockedCharactersViewModel().erased())
        let vc = UIHostingController(rootView: view)
        vc.view.frame = UIScreen.main.bounds
        assertSnapshot(matching: vc, as: .image)
    }
}
