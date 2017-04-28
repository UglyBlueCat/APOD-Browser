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
        let copyright = "Subaru, NAOJ"
        let date = "2017-04-28"
        let explanation = "Some 60 million light-years away in the southerly constellation Corvus, two large galaxies are colliding. Stars in the two galaxies, cataloged as NGC 4038 and NGC 4039, very rarely collide in the course of the ponderous cataclysm that lasts for hundreds of millions of years. But the galaxies' large clouds of molecular gas and dust often do, triggering furious episodes of star formation near the center of the cosmic wreckage. Spanning over 500 thousand light-years, this stunning view also reveals new star clusters and matter flung far from the scene of the accident by gravitational tidal forces. The remarkable mosaicked image was constructed using data from the ground-based Subaru telescope to bring out large-scale and faint tidal streams, and Hubble Space Telescope data of extreme detail in the bright cores. The suggestive visual appearance of the extended arcing structures gives the galaxy pair its popular name - The Antennae."
        let hdurl = "https://apod.nasa.gov/apod/image/1704/AntennaeColombari1824x0_q100_watermark.jpg"
        let media_type = "image"
        let service_version = "v1"
        let title = "Exploring the Antennae"
        let url = "https://apod.nasa.gov/apod/image/1704/AntennaeColombari1024_q100_watermark.jpg"
        
        let apod : APOD = APOD(copyright: copyright,
                               date: date,
                               explanation: explanation,
                               hdurl: hdurl,
                               media_type: media_type,
                               service_version: service_version,
                               title: title,
                               url: url)
        
        XCTAssert(apod.copyright == copyright)
        XCTAssert(apod.date == date)
        XCTAssert(apod.explanation == explanation)
        XCTAssert(apod.hdurl == hdurl)
        XCTAssert(apod.media_type == media_type)
        XCTAssert(apod.service_version == service_version)
        XCTAssert(apod.title == title)
        XCTAssert(apod.url == url)
    }
}
