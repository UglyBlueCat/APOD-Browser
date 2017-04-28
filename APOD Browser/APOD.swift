//
//  APOD.swift
//  APOD Browser
//
//  Created by Robin Spinks on 26/04/2017.
//  Copyright © 2017 Robin Spinks. All rights reserved.
//

import Foundation

class APOD {
    var copyright : String = ""
    var date : String = ""
    var explanation : String = ""
    var hdurl : String = ""
    var media_type : String = ""
    var service_version : String = ""
    var title : String = ""
    var url : String = ""
    
    init() {}
    
    init(copyright: String,
         date: String,
         explanation: String,
         hdurl: String,
         media_type: String,
         service_version: String,
         title: String,
         url: String) {
        
        self.copyright = copyright
        self.date = date
        self.explanation = explanation
        self.hdurl = hdurl
        self.media_type = media_type
        self.service_version = service_version
        self.title = title
        self.url = url
    }
}
