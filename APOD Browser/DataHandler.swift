//
//  DataHandler.swift
//  APOD Browser
//
//  Created by Robin Spinks on 20/04/2017.
//  Copyright © 2017 Robin Spinks. All rights reserved.
//

import Foundation

class DataHandler {
    
    /**
     Converts a raw data object to JSON, which is then passed to populateResults
     
     - parameter newData: The raw data
     */
    func newData (_ newData: Data) {
        do {
            let jsonData = try JSONSerialization.jsonObject(with: newData, options: .mutableLeaves)
            self.populateResults(jsonData: jsonData as AnyObject)
        } catch {
            DLog("JSON conversion error: \(error)")
        }
    }
    
    /**
     Separates a JSON Array into JSON Dictionary objects.
     
     - parameter jsonData: The JSON Array
     */
    func populateResults (jsonData: AnyObject) {
        if let APODObject = jsonData as? Dictionary<String, String> {
            handleAPODObject(APODObject)
        } else {
            DLog("Cannot convert data")
        }
    }
    
    func handleAPODObject(_ APODObject : Dictionary<String, String>) {
        
        let dataInterface = DataInterface()
        do {
            try dataInterface.saveAPODObject(APODObject)
        } catch {
            DLog("Error saving data: \(error.localizedDescription)")
        }
    }
}
