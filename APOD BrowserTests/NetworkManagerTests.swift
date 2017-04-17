//
//  NetworkManagerTests.swift
//  APOD Browser
//
//  Created by Robin Spinks on 17/04/2017.
//  Copyright © 2017 Robin Spinks. All rights reserved.
//

import XCTest
@testable import APOD_Browser

class NetworkManagerTests: XCTestCase {
    
    let networkManager : NetworkManager = NetworkManager()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testNetworkManagerExists() {
        XCTAssertNotNil(networkManager)
    }
    
    func testURLSessionExists() {
        XCTAssertNotNil(networkManager.urlSession)
    }
    
    func testRequestHandling() {
        let expect = expectation(description: "waitForNetworkManager")
        
        var testData : Data = Data()
        let method : String = "GET"
        let urlStr : String = "https://api.nasa.gov/planetary/apod"
        let params : Dictionary<String, String> = ["api_key": "DEMO_KEY"]
        
        networkManager.makeRequest(method: method, params: params, urlStr: urlStr) { (data, urlResponse, error) in
            guard error == nil else {
                XCTFail("error: \(String(describing: error))")
                return
            }
            guard data != nil else {
                XCTFail()
                return
            }
            testData = data!
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
        XCTAssert(testData.count > 0)
    }
}
