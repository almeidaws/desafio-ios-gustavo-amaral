//
//  NetworkingMethodsTests.swift
//  networking
//
//  Created by Gustavo Amaral on 09/04/20.
//  Copyright © 2020 Gustavo Almeida Amaral. All rights reserved.
//

import XCTest
import Combine
@testable import Networking

class NetworkingMethodsTests: XCTestCase {
    
    func testGetWithImageAsResponse() throws {
        let url = URL(string: "https://webapi.com")!
        
        let responseExpectation = self.expectation(description: "Wait network response")
        let publisher: AnyPublisher<UIImage, NetworkError> = get(from: url, mock: UIImage.add)
        _ = publisher.sink(receiveCompletion: { _ in }) { receivedImage in
            XCTAssert(receivedImage.pngData()! == UIImage.add.pngData()!, "Sent response isn't equal to the received.")
            responseExpectation.fulfill()
        }
        self.wait(for: [responseExpectation], timeout: 1)
    }

    func testGetWithNonEmptyResponse() throws {
        
        struct Character: Hashable, Codable {
            let name = "Iron Man"
            let power = "None"
        }
        let url = URL(string: "https://webapi.com")!
        
        let originalResponse = NetworkResponse.nonEmpty(try JSONEncoder().encode(Character()), .ok)
        let originalDecodedResponse = NetworkResponse.nonEmpty(Character(), .ok)
        
        let responseExpectation = self.expectation(description: "Wait network response")
        let publisher: AnyPublisher<NetworkResponse<Character>, NetworkError> = get(from: url, mock: originalResponse)
        _ = publisher.sink(receiveCompletion: { _ in }) { receivedResponse in
            XCTAssert(receivedResponse == originalDecodedResponse, "Sent response isn't equal to the received.")
            responseExpectation.fulfill()
        }
        self.wait(for: [responseExpectation], timeout: 1)
    }
    
    func testGetWithEmptyResponse() throws {
        let url = URL(string: "https://webapi.com")!
        
        let originalResponse = NetworkResponse<Data>.empty(.ok)
        
        let responseExpectation = self.expectation(description: "Wait network response")
        let publisher: AnyPublisher<NetworkResponse<Character>, NetworkError> = get(from: url, mock: originalResponse)
        _ = publisher.sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                 XCTAssert(error == NetworkError.emptyResponse, "Empty response has't generated an error.")
                 responseExpectation.fulfill()
            default: break
            }
        }, receiveValue: { _ in })
        self.wait(for: [responseExpectation], timeout: 1)
    }
    
    func testGetWithWrongDecoding() throws {
        
        struct Character: Hashable, Codable {
            let name = "Iron Man"
            let power = "None"
        }
        let url = URL(string: "https://webapi.com")!
        
        let originalResponse = NetworkResponse.nonEmpty(try JSONEncoder().encode(Character()), .ok)
        
        let responseExpectation = self.expectation(description: "Wait network response")
        let publisher: AnyPublisher<NetworkResponse<String>, NetworkError> = get(from: url, mock: originalResponse)
        _ = publisher.sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                switch error {
                case .decoding:
                    XCTAssert(true, "Wrong decoding hasn't generated an error.")
                    responseExpectation.fulfill()
                default: break
                }
            default: break
            }
        }) { _ in }
        
        self.wait(for: [responseExpectation], timeout: 1)
    }
    
    private struct Character: Hashable, Codable {
        let name = "Iron Man"
        let power = "None"
    }
}
