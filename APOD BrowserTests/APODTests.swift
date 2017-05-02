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
    
    let apiTestDict : Dictionary<String, String> = [
        "copyright" : "Public Domain",
        "date": "2017-05-01",
        "explanation": "The bright source near the center is a neutron star, the incredibly dense, collapsed remains of a massive stellar core. Surrounding it is supernova remnant Cassiopeia A (Cas A), a comfortable 11,000 light-years away. Light from the Cas A supernova, the death explosion of a massive star, first reached Earth about 350 years ago.  The expanding debris cloud spans about 15 light-years in this composite X-ray/optical image.  Still hot enough to emit X-rays, Cas A's neutron star is cooling. In fact, years of observations with the orbiting Chandra X-ray Observatory find that the neutron star is cooling rapidly --  so rapidly that researchers suspect a large part of the neutron star's core is forming a frictionless neutron superfluid. The Chandra results represent the first observational evidence for this bizarre state of neutron matter.",
        "hdurl": "https://apod.nasa.gov/apod/image/1705/casa_main_960.jpg",
        "media_type": "image",
        "service_version": "v1",
        "title": "Cooling Neutron Star",
        "url": "https://apod.nasa.gov/apod/image/1705/casa_main_960.jpg"]

    func testClassExists() {
        let _ : APOD = APOD()
    }
    
    func testInstanceNotNull() {
        let apod : APOD = APOD()
        
        XCTAssertNotNil(apod)
    }
    
    func testParameters() {
        let apod : APOD = APOD()
        
        XCTAssertNotNil(apod.copyright)
        XCTAssertNotNil(apod.date)
        XCTAssertNotNil(apod.explanation)
        XCTAssertNotNil(apod.hdurl)
        XCTAssertNotNil(apod.media_type)
        XCTAssertNotNil(apod.service_version)
        XCTAssertNotNil(apod.title)
        XCTAssertNotNil(apod.url)
    }
    
    func testParamInit() {
        let apod : APOD = APOD(apodDic : apiTestDict)
        
        XCTAssert(apod.copyright == apiTestDict["copyright"]!)
        XCTAssert(apod.date == apiTestDict["date"]!)
        XCTAssert(apod.explanation == apiTestDict["explanation"]!)
        XCTAssert(apod.hdurl == apiTestDict["hdurl"]!)
        XCTAssert(apod.media_type == apiTestDict["media_type"]!)
        XCTAssert(apod.service_version == apiTestDict["service_version"]!)
        XCTAssert(apod.title == apiTestDict["title"]!)
        XCTAssert(apod.url == apiTestDict["url"]!)
    }
}
