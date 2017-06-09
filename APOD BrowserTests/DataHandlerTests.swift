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
    let testDict : Dictionary<String, String> = [
        "copyright" : "Public Domain",
        "date": "2017-05-01",
        "explanation": "The bright source near the center is a neutron star, the incredibly dense, collapsed remains of a massive stellar core. Surrounding it is supernova remnant Cassiopeia A (Cas A), a comfortable 11,000 light-years away. Light from the Cas A supernova, the death explosion of a massive star, first reached Earth about 350 years ago.  The expanding debris cloud spans about 15 light-years in this composite X-ray/optical image.  Still hot enough to emit X-rays, Cas A's neutron star is cooling. In fact, years of observations with the orbiting Chandra X-ray Observatory find that the neutron star is cooling rapidly --  so rapidly that researchers suspect a large part of the neutron star's core is forming a frictionless neutron superfluid. The Chandra results represent the first observational evidence for this bizarre state of neutron matter.",
        "hdurl": "https://apod.nasa.gov/apod/image/1705/casa_main_960.jpg",
        "media_type": "image",
        "service_version": "v1",
        "title": "Cooling Neutron Star",
        "url": "https://apod.nasa.gov/apod/image/1705/casa_main_960.jpg"]
    
    override func tearDown() {
        super.tearDown()
        
        var fileHandler = FileHandler()
        
        guard let date = testDict["date"] else {
            XCTFail("Cannot read date from Dictionary parameter as String")
            return
        }
        
        do {
            fileHandler = try FileHandler(fileName: date)
            try fileHandler.delete()
        } catch {
            XCTFail("Error deleting file: \(error.localizedDescription)")
        }
    }
    
    func testDataHandlerStoresData() {
        
        var testData = Data()
        var resultDict : Dictionary<String, String> = [:]
        let dataInterface = DataInterface()
        
        do {
            testData = try JSONSerialization.data(withJSONObject: testDict)
        } catch {
            XCTFail("Error converting testDict to Data: \(error.localizedDescription)")
        }
        
        dataHandler.newData(testData)
        
        do {
            resultDict = try dataInterface.loadAPODObject(testDict["date"]!)
        } catch {
            XCTFail("Error loading object: \(error.localizedDescription)")
        }
        
        XCTAssertEqual(testDict.count, resultDict.count)
        XCTAssertEqual(testDict["copyright"], resultDict["copyright"])
        XCTAssertEqual(testDict["date"], resultDict["date"])
        XCTAssertEqual(testDict["explanation"], resultDict["explanation"])
        XCTAssertEqual(testDict["hdurl"], resultDict["hdurl"])
        XCTAssertEqual(testDict["media_type"], resultDict["media_type"])
        XCTAssertEqual(testDict["service_version"], resultDict["service_version"])
        XCTAssertEqual(testDict["title"], resultDict["title"])
        XCTAssertEqual(testDict["url"], resultDict["url"])
    }
}
