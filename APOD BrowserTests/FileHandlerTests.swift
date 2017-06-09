//
//  FileHandlerTests.swift
//  APOD Browser
//
//  Created by Robin Spinks on 29/05/2017.
//  Copyright © 2017 Robin Spinks. All rights reserved.
//

import XCTest
@testable import APOD_Browser

class FileHandlerTests: XCTestCase {
    var testFile : FileHandler = FileHandler()
    
    func testWriteAndReadAPODObject() {
        var testData : Data = Data()
        var readData : Data = Data()
        
        let testDict : Dictionary<String, Any> = ["array":[1,2,3], "boolean":true, "number":123, "object":["a":"b","c":"d","e":"f"], "string":"Hello World"]
        
        do {
            try testFile = FileHandler(fileName: "testFile")
        } catch {
            XCTFail("Failed file URL creation: \(error.localizedDescription)")
        }
        
        do {
            testData = try JSONSerialization.data(withJSONObject: testDict)
        } catch {
            XCTFail("Failed to convert testDict to JSON data: \(error.localizedDescription)")
        }
        
        do {
            try testFile.write(testData)
        } catch {
            XCTFail("Failed to write to file: \(error.localizedDescription)")
        }
        
        do {
            readData = try testFile.read()
        } catch {
            XCTFail("Failed to read from file: \(error.localizedDescription)")
        }
        
        XCTAssertEqual(testData, readData)
        
        do {
            try testFile.delete()
        } catch {
            XCTFail("Failed to delete file: \(error.localizedDescription)")
        }
    }
}
