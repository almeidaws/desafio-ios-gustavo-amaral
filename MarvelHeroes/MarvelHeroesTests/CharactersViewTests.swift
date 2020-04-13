//
//  CharactersViewTests.swift
//  CharactersViewTests
//
//  Created by Gustavo Amaral on 11/04/20.
//  Copyright © 2020 Gustavo Almeida Amaral. All rights reserved.
//

import XCTest
import SnapshotTesting
@testable import Marvel_s_Heroes
import SwiftUI

fileprivate let thumbnail = UIImage(contentsOfFile: Bundle(identifier: "com.almeidaws.MarvelHeroesTests")!.path(forResource: "thumbnail", ofType: "jpg")!)!

class CharactersViewTests: XCTestCase {
    
    override class func setUp() {
//        record = true
    }
    
    func testiPhoneXLightModePortrait() throws {
        let view = CharactersView(viewModel: MockedCharactersViewModel().erased())
            .environment(\.imageLoaderFactory, { _ in MockedImageLoader(image: thumbnail).erased() })
            .environment(\.isURLImageAnimationEnabled, false)
        let vc = UIHostingController(rootView: view)
        vc.view.frame = UIScreen.main.bounds
        
        let expectation = self.expectation(description: "Wait")
        DispatchQueue.main.async {
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 1)
        
        assertSnapshot(matching: vc, as: .image(on: .iPhoneX(.portrait)))
    }
    
    func testiPhoneXLightModeLandscape() throws {
        let view = CharactersView(viewModel: MockedCharactersViewModel().erased())
            .environment(\.imageLoaderFactory, { _ in MockedImageLoader(image: thumbnail).erased() })
            .environment(\.isURLImageAnimationEnabled, false)
        let vc = UIHostingController(rootView: view)
        vc.view.frame = UIScreen.main.bounds
        
        let expectation = self.expectation(description: "Wait")
        DispatchQueue.main.async {
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 1)
        
        assertSnapshot(matching: vc, as: .image(on: .iPhoneX(.landscape)))
    }
    
    func testiPhoneXDarkModePortrait() throws {
        let view = CharactersView(viewModel: MockedCharactersViewModel().erased())
            .environment(\.imageLoaderFactory, { _ in MockedImageLoader(image: thumbnail).erased() })
            .environment(\.isURLImageAnimationEnabled, false)
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
    
    func testiPhoneXDarkModeLandscape() throws {
        let view = CharactersView(viewModel: MockedCharactersViewModel().erased())
            .environment(\.imageLoaderFactory, { _ in MockedImageLoader(image: thumbnail).erased() })
            .environment(\.isURLImageAnimationEnabled, false)
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
    
    func testiPadMiniLightModePortrait() throws {
        let view = CharactersView(viewModel: MockedCharactersViewModel().erased())
            .environment(\.imageLoaderFactory, { _ in MockedImageLoader(image: thumbnail).erased() })
            .environment(\.isURLImageAnimationEnabled, false)
        let vc = UIHostingController(rootView: view)
        vc.view.frame = UIScreen.main.bounds
        
        let expectation = self.expectation(description: "Wait")
        DispatchQueue.main.async {
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 1)
        
        assertSnapshot(matching: vc, as: .image(on: .iPadMini(.portrait)))
    }
    
    func testiPadMiniLightModeLandscape() throws {
        let view = CharactersView(viewModel: MockedCharactersViewModel().erased())
            .environment(\.imageLoaderFactory, { _ in MockedImageLoader(image: thumbnail).erased() })
            .environment(\.isURLImageAnimationEnabled, false)
        let vc = UIHostingController(rootView: view)
        vc.view.frame = UIScreen.main.bounds
        
        let expectation = self.expectation(description: "Wait")
        DispatchQueue.main.async {
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 1)
        
        assertSnapshot(matching: vc, as: .image(on: .iPadMini(.landscape)))
    }
    
    func testiPadMiniDarkModePortrait() throws {
        let view = CharactersView(viewModel: MockedCharactersViewModel().erased())
            .environment(\.imageLoaderFactory, { _ in MockedImageLoader(image: thumbnail).erased() })
            .environment(\.isURLImageAnimationEnabled, false)
            .environment(\.colorScheme, .dark)
        let vc = UIHostingController(rootView: view)
        vc.view.frame = UIScreen.main.bounds
        
        let expectation = self.expectation(description: "Wait")
        DispatchQueue.main.async {
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 1)
        
        assertSnapshot(matching: vc, as: .image(on: .iPadMini(.portrait)))
    }
    
    func testiPadMiniDarkModeLandscape() throws {
        let view = CharactersView(viewModel: MockedCharactersViewModel().erased())
            .environment(\.imageLoaderFactory, { _ in MockedImageLoader(image: thumbnail).erased() })
            .environment(\.isURLImageAnimationEnabled, false)
            .environment(\.colorScheme, .dark)
        let vc = UIHostingController(rootView: view)
        vc.view.frame = UIScreen.main.bounds
        
        let expectation = self.expectation(description: "Wait")
        DispatchQueue.main.async {
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 1)
        
        assertSnapshot(matching: vc, as: .image(on: .iPadMini(.landscape)))
    }
    
    func testiPhoneSELightModePortrait() throws {
        let view = CharactersView(viewModel: MockedCharactersViewModel().erased())
            .environment(\.imageLoaderFactory, { _ in MockedImageLoader(image: thumbnail).erased() })
            .environment(\.isURLImageAnimationEnabled, false)
        let vc = UIHostingController(rootView: view)
        vc.view.frame = UIScreen.main.bounds
        
        let expectation = self.expectation(description: "Wait")
        DispatchQueue.main.async {
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 1)
        
        assertSnapshot(matching: vc, as: .image(on: .iPhoneSe(.portrait)))
    }
    
    func testiPhoneSELightModeLandscape() throws {
        let view = CharactersView(viewModel: MockedCharactersViewModel().erased())
            .environment(\.imageLoaderFactory, { _ in MockedImageLoader(image: thumbnail).erased() })
            .environment(\.isURLImageAnimationEnabled, false)
        let vc = UIHostingController(rootView: view)
        vc.view.frame = UIScreen.main.bounds
        
        let expectation = self.expectation(description: "Wait")
        DispatchQueue.main.async {
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 1)
        
        assertSnapshot(matching: vc, as: .image(on: .iPhoneSe(.landscape)))
    }
    
    func testiPhoneSEDarkModePortrait() throws {
        let view = CharactersView(viewModel: MockedCharactersViewModel().erased())
            .environment(\.imageLoaderFactory, { _ in MockedImageLoader(image: thumbnail).erased() })
            .environment(\.isURLImageAnimationEnabled, false)
            .environment(\.colorScheme, .dark)
        let vc = UIHostingController(rootView: view)
        vc.view.frame = UIScreen.main.bounds
        
        let expectation = self.expectation(description: "Wait")
        DispatchQueue.main.async {
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 1)
        
        assertSnapshot(matching: vc, as: .image(on: .iPhoneSe(.portrait)))
    }
    
    func testiPhoneSEDarkModeLandscape() throws {
        let view = CharactersView(viewModel: MockedCharactersViewModel().erased())
            .environment(\.imageLoaderFactory, { _ in MockedImageLoader(image: thumbnail).erased() })
            .environment(\.isURLImageAnimationEnabled, false)
            .environment(\.colorScheme, .dark)
        let vc = UIHostingController(rootView: view)
        vc.view.frame = UIScreen.main.bounds
        
        let expectation = self.expectation(description: "Wait")
        DispatchQueue.main.async {
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 1)
        
        assertSnapshot(matching: vc, as: .image(on: .iPhoneSe(.landscape)))
    }
}
