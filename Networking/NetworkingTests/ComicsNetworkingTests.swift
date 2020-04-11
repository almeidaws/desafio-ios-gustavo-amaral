//
//  ComicsNetworkingTests.swift
//  NetworkingTests
//
//  Created by Gustavo Amaral on 10/04/20.
//  Copyright © 2020 Gustavo Almeida Amaral. All rights reserved.
//

import XCTest
import Combine
@testable import Networking

fileprivate let testsBundle = Bundle(identifier: "com.almeidaws.NetworkingTests")!

class ComicsNetworkingTests: XCTestCase {

    func testGetComicsWithValidResponse() throws {
        let data = try! Data(contentsOf: testsBundle.url(forResource: "comicsResponse1", withExtension: "txt")!)
        let responseExpection = expectation(description: "Wait for valid comics response.")
        let testsBundle = Bundle(identifier: "com.almeidaws.NetworkingTests")!
        _ = getComics(byCharacter: "123", limit: 1, offset: 1, bundle: testsBundle, mock: .nonEmpty(data, .ok))
            .sink(receiveCompletion: { completio_ in }) { comics in
                let validComics = try! JSONDecoder().decode(CommonBody<ComicBody>.self, from: data).data.results
                XCTAssert(comics == validComics, "Input sent to the function isn't equal to the expected decoded value.")
                responseExpection.fulfill()
        }
        
        self.wait(for: [responseExpection], timeout: 1)
    }
    
    func testGetComicsDifferentValidResponse() throws {
        let data = try! Data(contentsOf: testsBundle.url(forResource: "comicsResponse1", withExtension: "txt")!)
        let validResponse2 = try! Data(contentsOf: testsBundle.url(forResource: "comicsResponse2", withExtension: "txt")!)
        let responseExpection = expectation(description: "Wait for valid comics response.")
        let testsBundle = Bundle(identifier: "com.almeidaws.NetworkingTests")!
        _ = getComics(byCharacter: "123", limit: 1, offset: 1, bundle: testsBundle, mock: .nonEmpty(data, .ok))
            .sink(receiveCompletion: { completio_ in }) { comics in
                let validComics = try! JSONDecoder().decode(CommonBody<ComicBody>.self, from: validResponse2).data.results
                XCTAssert(comics != validComics, "Input sent to the function isn't equal to the expected decoded value.")
                responseExpection.fulfill()
        }
        
        self.wait(for: [responseExpection], timeout: 1)
    }

}
