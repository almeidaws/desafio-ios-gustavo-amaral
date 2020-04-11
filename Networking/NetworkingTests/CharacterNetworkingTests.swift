//
//  CharacterNetworkingTests.swift
//  Networking
//
//  Created by Gustavo Amaral on 10/04/20.
//  Copyright © 2020 Gustavo Almeida Amaral. All rights reserved.
//

import XCTest
import Combine
@testable import Networking

fileprivate let testsBundle = Bundle(identifier: "com.almeidaws.NetworkingTests")!

class CharacterNetworkingTests: XCTestCase {

    func testGetCharactersWithValidResponse() throws {
        let data = try! Data(contentsOf: testsBundle.url(forResource: "charactersResponse1", withExtension: "txt")!)
        let responseExpection = expectation(description: "Wait for valid character response.")
        _ = getCharacters(limit: 1, offset: 1, bundle: testsBundle, mock: .nonEmpty(data, .ok))
            .sink(receiveCompletion: { _ in }) { characters in
                let validCharacters = try! JSONDecoder().decode(CommonBody<CharacterBody>.self, from: data).data.results
                
                XCTAssert(validCharacters == characters, "Input sent to the function isn't equal to the expected decoded value.")
                responseExpection.fulfill()
        }
        
        self.wait(for: [responseExpection], timeout: 1)
    }
    
    func testGetCharactersWithDifferentResponse() throws {
        let data = try! Data(contentsOf: testsBundle.url(forResource: "charactersResponse1", withExtension: "txt")!)
        let validResponse2 = try! Data(contentsOf: testsBundle.url(forResource: "charactersResponse2", withExtension: "txt")!)
        let responseExpection = expectation(description: "Wait for valid character response.")
        _ = getCharacters(limit: 1, offset: 1, bundle: testsBundle, mock: .nonEmpty(data, .ok))
            .sink(receiveCompletion: { _ in }) { characters in
                let validCharacters = try! JSONDecoder().decode(CommonBody<CharacterBody>.self, from: validResponse2).data.results
                
                XCTAssert(validCharacters != characters, "Input sent to the function isn't equal to the expected decoded value.")
                responseExpection.fulfill()
        }
        
        self.wait(for: [responseExpection], timeout: 1)
    }

}
