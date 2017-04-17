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
}
