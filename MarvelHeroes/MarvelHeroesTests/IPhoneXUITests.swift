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
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        
    }
    
    func testLightModePortrait() throws {
        let view = CharactersView(viewModel: MockedCharactersViewModel().erased())
            .environment(\.imageLoaderFactory, { MockedImageLoader(image: thumbnail).erased() })
        let vc = UIHostingController(rootView: view)
        vc.view.frame = UIScreen.main.bounds
        
        let expectation = self.expectation(description: "Wait")
        DispatchQueue.main.async {
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 1)
        
        assertSnapshot(matching: vc, as: .image(on: .iPhoneX(.portrait)))
    }
    
    func testLightModeLandscape() throws {
        let view = CharactersView(viewModel: MockedCharactersViewModel().erased())
            .environment(\.imageLoaderFactory, { MockedImageLoader(image:#imageLiteral(resourceName: "thumbnail.jpg") ).erased() })
        let vc = UIHostingController(rootView: view)
        vc.view.frame = UIScreen.main.bounds
        
        let expectation = self.expectation(description: "Wait")
        DispatchQueue.main.async {
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 1)

        assertSnapshot(matching: vc, as: .image(on: .iPhoneX(.landscape)))
    }

    func testDarkModePortrait() throws {
        let view = CharactersView(viewModel: MockedCharactersViewModel().erased())
            .environment(\.imageLoaderFactory, { MockedImageLoader(image: thumbnail).erased() })
            .environment(\.colorScheme, .dark)
        let vc = UIHostingController(rootView: view)
        vc.view.frame = UIScreen.main.bounds
        
        let expectation = self.expectation(description: "Wait")
        DispatchQueue.main.async {
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 1)

        assertSnapshot(matching: vc, as: .image(on: .iPhoneX(.portrait)))
    }

    func testDarkModeLandscape() throws {
        let view = CharactersView(viewModel: MockedCharactersViewModel().erased())
            .environment(\.imageLoaderFactory, { MockedImageLoader(image: thumbnail).erased() })
            .environment(\.colorScheme, .dark)
        let vc = UIHostingController(rootView: view)
        vc.view.frame = UIScreen.main.bounds
        
        let expectation = self.expectation(description: "Wait")
        DispatchQueue.main.async {
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 1)

        assertSnapshot(matching: vc, as: .image(on: .iPhoneX(.landscape)))
    }
}

extension Snapshotting where Value: UIViewController, Format == UIImage {
    static var windowedImage: Snapshotting {
        return Snapshotting<UIImage, UIImage>.image.asyncPullback { vc in
            Async<UIImage> { callback in
                UIView.setAnimationsEnabled(false)
                let window = UIApplication.shared.windows.first!
                window.rootViewController = vc
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    let image = UIGraphicsImageRenderer(bounds: window.bounds).image { ctx in
                        window.drawHierarchy(in: window.bounds, afterScreenUpdates: true)
                    }
                    callback(image)
                    UIView.setAnimationsEnabled(true)
                }
            }
        }
    }
}
