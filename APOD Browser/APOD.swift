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
    
    init(apodDic : Dictionary<String, String>) {
        DLog("apodDic:\n\(apodDic)")
        self.copyright = apodDic["copyright"] ?? "Public Domain"
        self.date = apodDic["date"] ?? ""
        self.explanation = apodDic["explanation"] ?? ""
        self.hdurl = apodDic["hdurl"] ?? ""
        self.media_type = apodDic["media_type"] ?? ""
        self.service_version = apodDic["service_version"] ?? ""
        self.title = apodDic["title"] ?? ""
        self.url = apodDic["url"] ?? ""
    }
}
