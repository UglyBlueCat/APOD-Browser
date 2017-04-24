//
//  DataHandlerTests.swift
//  APOD Browser
//
//  Created by Robin Spinks on 20/04/2017.
//  Copyright © 2017 Robin Spinks. All rights reserved.
//

import XCTest
@testable import APOD_Browser

class DataHandlerTests: XCTestCase {
    
    let dataHandler : DataHandler = DataHandler()
    
    func testDataHandlerExists() {
        XCTAssertNotNil(dataHandler)
    }
    
    func testDataHandlerCanReceiveData() {
        let data : Data = Data()
        
        dataHandler.newData(data: data)
    }
}
