//
//  IPhoneXUITests.swift
//  IPhoneXUITests
//
//  Created by Gustavo Amaral on 11/04/20.
//  Copyright © 2020 Gustavo Almeida Amaral. All rights reserved.
//

import XCTest
import SnapshotTesting
@testable import Marvel_Heroes
import SwiftUI

fileprivate let thumbnail = UIImage(contentsOfFile: Bundle(identifier: "com.almeidaws.MarvelHeroesTests")!.path(forResource: "thumbnail", ofType: "jpg")!)!

class IPhoneXUITests: XCTestCase {
    
    override class func setUp() {
//        record = true
    }
    
    func testLightModePortrait() throws {
        let view = CharactersView(viewModel: MockedCharactersViewModel().erased())
            .environment(\.imageLoaderFactory, { MockedImageLoader(image: thumbnail).erased() })
            .environment(\.isURLImageAnimationEnabled, false)
        let vc = UIHostingController(rootView: view)
        vc.view.frame = UIScreen.main.bounds
        
        let expectation = self.expectation(description: "Wait")
        DispatchQueue.main.async {
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 1)
        
        assertSnapshot(matching: vc, as: .recursiveDescription(on: .iPhoneX, size: .init(width: 375, height: 812), traits: .iPhoneX(.portrait)))
    }
    
    func testLightModeLandscape() throws {
        let view = CharactersView(viewModel: MockedCharactersViewModel().erased())
            .environment(\.imageLoaderFactory, { MockedImageLoader(image: thumbnail).erased() })
        .environment(\.isURLImageAnimationEnabled, false)
        let vc = UIHostingController(rootView: view)
        vc.view.frame = UIScreen.main.bounds
        
        let expectation = self.expectation(description: "Wait")
        DispatchQueue.main.async {
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 1)

        assertSnapshot(matching: vc, as: .recursiveDescription(on: .iPhoneX, size: .init(width: 812, height: 375), traits: .iPhoneX(.landscape)))
    }

    func testDarkModePortrait() throws {
        let view = CharactersView(viewModel: MockedCharactersViewModel().erased())
            .environment(\.imageLoaderFactory, { MockedImageLoader(image: thumbnail).erased() })
            .environment(\.isURLImageAnimationEnabled, false)
            .environment(\.colorScheme, .dark)
        let vc = UIHostingController(rootView: view)
        vc.view.frame = UIScreen.main.bounds
        
        let expectation = self.expectation(description: "Wait")
        DispatchQueue.main.async {
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 1)

        assertSnapshot(matching: vc, as: .image(on: .iPhoneX, precision: 0.99, size: .init(width: 375, height: 812), traits: .iPhoneX(.portrait)))
    }

    func testDarkModeLandscape() throws {
        let view = CharactersView(viewModel: MockedCharactersViewModel().erased())
            .environment(\.imageLoaderFactory, { MockedImageLoader(image: thumbnail).erased() })
            .environment(\.isURLImageAnimationEnabled, false)
            .environment(\.colorScheme, .dark)
        let vc = UIHostingController(rootView: view)
        vc.view.frame = UIScreen.main.bounds
        
        let expectation = self.expectation(description: "Wait")
        DispatchQueue.main.async {
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 1)

        assertSnapshot(matching: vc, as: .image(on: .iPhoneX, precision: 0.99, size: .init(width: 812, height: 375), traits: .iPhoneX(.landscape)))
    }
}
