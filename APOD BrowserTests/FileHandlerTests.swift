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
    
    func testWriteAndReadImage() {
        var readImage = UIImage()
        
        guard let testImage = UIImage(color: UIColor.purple) else {
            XCTFail("Cannot create test image")
            return
        }
        
        do {
            try testFile = FileHandler(fileName: "testImage")
        } catch {
            XCTFail("Failed file URL creation: \(error.localizedDescription)")
        }
        
        do {
            try testFile.writeImage(testImage)
        } catch {
            XCTFail("Error writing image: \(error.localizedDescription)")
        }
        
        do {
            readImage = try testFile.readImage()
        } catch {
            XCTFail("Error reading image: \(error.localizedDescription)")
        }
        
        XCTAssertEqual(testImage.size, readImage.size)
        
        guard let testImagedata = UIImagePNGRepresentation(testImage) else {
            XCTFail("Cannot convert test UIImage to Data")
            return
        }
        
        guard let readImagedata = UIImagePNGRepresentation(readImage) else {
            XCTFail("Cannot convert read UIImage to Data")
            return
        }
        
        XCTAssertEqual(testImagedata, readImagedata)
    }
}

/*
 * Create image from colour
 * Taken from http://stackoverflow.com/questions/26542035/create-uiimage-with-solid-color-in-swift
 */
public extension UIImage {
    public convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}
