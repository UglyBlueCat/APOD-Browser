//
//  APODTests.swift
//  APOD Browser
//
//  Created by Robin Spinks on 26/04/2017.
//  Copyright © 2017 Robin Spinks. All rights reserved.
//

import XCTest
@testable import APOD_Browser

class APODTests: XCTestCase {

    func testClassExists() {
        let _ : APOD = APOD()
    }
    
    func testInstanceNotNull() {
        let apod : APOD = APOD()
        
        XCTAssertNotNil(apod)
    }
}
