//
//  NetworkManager.swift
//  APOD Browser
//
//  Created by Robin Spinks on 17/04/2017.
//  Copyright © 2017 Robin Spinks. All rights reserved.
//

import UIKit

class NetworkManager: NSObject {
    
    let urlSession : URLSession
    
    override init() {
        self.urlSession = URLSession(configuration: .default)
    }
    
    func makeRequest(method: String,
                     params: Dictionary<String, String>,
                     urlStr: String,
                     completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
    }
}
