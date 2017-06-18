//
//  NetworkInterface.swift
//  APOD Browser
//
//  Created by Robin Spinks on 11/06/2017.
//  Copyright © 2017 Robin Spinks. All rights reserved.
//

import Foundation

class NetworkInterface {
    
    func downloadAPODObject(date : Date? = nil, completion : (() -> Void)? = nil) {
        
        let networkManager = NetworkManager()
        let dataHandler = DataHandler()
        var params : Dictionary<String, String> = ["api_key": apiKey]
        
        if date != nil {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            params["date"] = formatter.string(from: date!)
        }
        
        networkManager.getRequest(params: params, urlStr: apiURL) {
            (data, urlResponse, error) in
            
            guard error == nil else {
                DLog("error: \(String(describing: error))")
                return
            }
            
            guard data != nil else {
                DLog("null data")
                return
            }
            
            if let httpResponse = urlResponse as? HTTPURLResponse {
                DLog("status code == \(httpResponse.statusCode)")
            } else {
                DLog("unable to cast URLResponse to HTTPURLResponse")
            }
            
            dataHandler.newData(data!)
            
            completion!()
        }
    }
    
    func downloadImage() {
        
    }
}
