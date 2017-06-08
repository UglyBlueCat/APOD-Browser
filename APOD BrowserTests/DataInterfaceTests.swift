//
//  DataInterfaceTests.swift
//  APOD Browser
//
//  Created by Robin Spinks on 07/06/2017.
//  Copyright © 2017 Robin Spinks. All rights reserved.
//

import XCTest
@testable import APOD_Browser

class DataInterfaceTests: XCTestCase {
    
    let dataInterface = DataInterface()
    
    func testAPODObjectSaveAndLoad() {
        
        let testDict : Dictionary<String, String> = [
            "copyright" : "Public Domain",
            "date": "2017-05-01",
            "explanation": "The bright source near the center is a neutron star, the incredibly dense, collapsed remains of a massive stellar core. Surrounding it is supernova remnant Cassiopeia A (Cas A), a comfortable 11,000 light-years away. Light from the Cas A supernova, the death explosion of a massive star, first reached Earth about 350 years ago.  The expanding debris cloud spans about 15 light-years in this composite X-ray/optical image.  Still hot enough to emit X-rays, Cas A's neutron star is cooling. In fact, years of observations with the orbiting Chandra X-ray Observatory find that the neutron star is cooling rapidly --  so rapidly that researchers suspect a large part of the neutron star's core is forming a frictionless neutron superfluid. The Chandra results represent the first observational evidence for this bizarre state of neutron matter.",
            "hdurl": "https://apod.nasa.gov/apod/image/1705/casa_main_960.jpg",
            "media_type": "image",
            "service_version": "v1",
            "title": "Cooling Neutron Star",
            "url": "https://apod.nasa.gov/apod/image/1705/casa_main_960.jpg"]
        var resultDict : Dictionary<String, String> = [:]
        
        do {
            try dataInterface.saveAPODObject(testDict)
        } catch {
            XCTFail("Error saving object: \(error.localizedDescription)")
        }
        
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
