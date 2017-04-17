//
//  Globals.swift
//  APOD Browser
//
//  Created by Robin Spinks on 17/04/2017.
//  Copyright © 2017 Robin Spinks. All rights reserved.
//

import Foundation

let apiURL = "https://api.nasa.gov/planetary/apod"
let apiKey = "DEMO_KEY"

/**
 Prints a message to the console prefixed with filename, function & line number.
 A replacement for \_\_PRETTY_FUNCTION__
 
 - parameters:
 - msg: The message to print
 - function: The calling function or method (Defaults to #function)
 - file: The file containing function (Defaults to #file)
 - line: The line of the DLog call (Defaults to #line)
 */
func DLog(_ msg: String, function: String = #function, file: String = #file, line: Int = #line) {
    let url = URL(fileURLWithPath: file)
    let className:String = url.lastPathComponent
    print("[\(className) \(function)](\(line)) \(msg)")
}
