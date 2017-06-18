//
//  NetworkInterfaceTests.swift
//  APOD Browser
//
//  Created by Robin Spinks on 11/06/2017.
//  Copyright © 2017 Robin Spinks. All rights reserved.
//

import XCTest
@testable import APOD_Browser

class NetworkInterfaceTests: XCTestCase {
    
    let networkInterface = NetworkInterface()
    let dataInterface = DataInterface()

    func testDownloadAPODObject() {
        let expect = expectation(description: "waitForNetworkManager")
        var loadedAPODObj : Dictionary<String, String> = [:]
        
        networkInterface.downloadAPODObject { () in
            expect.fulfill()
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let todaysDate = formatter.string(from: Date())
        
        waitForExpectations(timeout: 10, handler: nil)
        
        do {
            loadedAPODObj = try dataInterface.loadAPODObject(todaysDate)
        } catch {
            XCTFail("Error loading APOD object: \(error.localizedDescription)")
        }
        
        XCTAssertEqual(loadedAPODObj["date"], todaysDate)
    }
    
    func testDownloadImage() {
        networkInterface.downloadImage()
    }
}
