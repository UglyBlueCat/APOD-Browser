//
//  DataInterface.swift
//  APOD Browser
//
//  Created by Robin Spinks on 07/06/2017.
//  Copyright © 2017 Robin Spinks. All rights reserved.
//

import Foundation

class DataInterface {
    
    enum DataInterfaceError: Error {
        case parameterReadError(_ : String)
    }
    
    var fileHandler = FileHandler()
    
    func saveAPODObject(_ APODDict: Dictionary<String, String>) throws {
        
        var APODData = Data()
        
        guard let date = APODDict["date"] else {
            throw DataInterfaceError.parameterReadError("Cannot read date from Dictionary parameter as String")
        }
        
        do {
            fileHandler = try FileHandler(fileName: date)
            APODData = try JSONSerialization.data(withJSONObject: APODDict)
            try fileHandler.write(APODData)
        } catch {
            throw error
        }
    }
    
    func loadAPODObject(_ date : String) throws -> Dictionary<String, String> {
        
        var APODData = Data()
        var resultDict : Dictionary<String, String> = [:]
        
        do {
            fileHandler = try FileHandler(fileName: date)
            APODData = try fileHandler.read()
            resultDict = try JSONSerialization.jsonObject(with: APODData) as! Dictionary<String, String>
        } catch {
            throw error
        }
        
        return resultDict
    }
}
