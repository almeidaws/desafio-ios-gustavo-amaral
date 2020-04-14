//
//  DetailedCharacterViewTests.swift
//  DetailedCharacterViewTests
//
//  Created by Gustavo Amaral on 12/04/20.
//  Copyright © 2020 Gustavo Almeida Amaral. All rights reserved.
//

import XCTest
import SnapshotTesting
@testable import Marvel_s_Heroes
import SwiftUI
@testable import Networking

fileprivate let landscape = UIImage(contentsOfFile: Bundle(identifier: "com.almeidaws.MarvelHeroesTests")!.path(forResource: "landscape", ofType: "jpg")!)!
fileprivate let portrait = UIImage(contentsOfFile: Bundle(identifier: "com.almeidaws.MarvelHeroesTests")!.path(forResource: "portrait", ofType: "jpg")!)!
fileprivate let character = { () -> Character in
    let testsBundle = Bundle(identifier: "com.almeidaws.MarvelHeroesTests")!
    let url = testsBundle.url(forResource: "characters", withExtension: "txt")!
    let data = try! Data(contentsOf: url)
    let decodedCharacters = try! JSONDecoder().decode(CommonBody<CharacterBody>.self, from: data)
    return decodedCharacters.data.results.mapToCharacters()[4]
}()

class DetailedCharacterViewTests: XCTestCase {
    
    override class func setUp() {
//        record = true
    }
    
    func testiPhoneXLightModePortrait() throws {
        let view = CharactersView(viewModel: CharactersViewModel(MockedCharactersLoader()), initialCharacter: character)
            .environment(\.imageLoaderFactory, { _ in MockedImageLoader(image: portrait).erased() })
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
        let view = CharactersView(viewModel: CharactersViewModel(MockedCharactersLoader()), initialCharacter: character)
        .environment(\.imageLoaderFactory, { _ in MockedImageLoader(image: landscape).erased() })
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
        let view = CharactersView(viewModel: CharactersViewModel(MockedCharactersLoader()), initialCharacter: character)
            .environment(\.imageLoaderFactory, { _ in MockedImageLoader(image: portrait).erased() })
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
        let view = CharactersView(viewModel: CharactersViewModel(MockedCharactersLoader()), initialCharacter: character)
            .environment(\.imageLoaderFactory, { _ in MockedImageLoader(image: landscape).erased() })
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
        let view = CharactersView(viewModel: CharactersViewModel(MockedCharactersLoader()), initialCharacter: character)
            .environment(\.imageLoaderFactory, { _ in MockedImageLoader(image: portrait).erased() })
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
        let view = CharactersView(viewModel: CharactersViewModel(MockedCharactersLoader()), initialCharacter: character)
            .environment(\.imageLoaderFactory, { _ in MockedImageLoader(image: landscape).erased() })
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
        let view = CharactersView(viewModel: CharactersViewModel(MockedCharactersLoader()), initialCharacter: character)
            .environment(\.imageLoaderFactory, { _ in MockedImageLoader(image: portrait).erased() })
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
        let view = CharactersView(viewModel: CharactersViewModel(MockedCharactersLoader()), initialCharacter: character)
            .environment(\.imageLoaderFactory, { _ in MockedImageLoader(image: landscape).erased() })
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
        let view = CharactersView(viewModel: CharactersViewModel(MockedCharactersLoader()), initialCharacter: character)
            .environment(\.imageLoaderFactory, { _ in MockedImageLoader(image: portrait).erased() })
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
        let view = CharactersView(viewModel: CharactersViewModel(MockedCharactersLoader()), initialCharacter: character)
            .environment(\.imageLoaderFactory, { _ in MockedImageLoader(image: landscape).erased() })
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
        let view = CharactersView(viewModel: CharactersViewModel(MockedCharactersLoader()), initialCharacter: character)
            .environment(\.imageLoaderFactory, { _ in MockedImageLoader(image: portrait).erased() })
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
        let view = CharactersView(viewModel: CharactersViewModel(MockedCharactersLoader()), initialCharacter: character)
            .environment(\.imageLoaderFactory, { _ in MockedImageLoader(image: landscape).erased() })
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
