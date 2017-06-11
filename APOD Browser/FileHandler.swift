//
//  FileHandler.swift
//  APOD Browser
//
//  Created by Robin Spinks on 29/05/2017.
//  Copyright © 2017 Robin Spinks. All rights reserved.
//

import Foundation
import UIKit

class FileHandler {
    
    enum FileHandlerError: Error {
        case findPathError
        case appendFolderError(_ : String)
        case writeError(_ : String)
        case conversionError(_ : String)
    }
    
    var fileURL : URL!
    
    init() {}
    
    init(fileName : String) throws {
        do {
            try createFileURL(fileName)
        } catch {
            throw error
        }
    }
    
    /**
     Creates a URL for a file and assigns it to the global variable fileURL
     
     - parameters:
         - fileName: The name of the file
     
     - throws: An error describing what went wrong
     */
    private func createFileURL(_ fileName : String) throws {
        let folder = "APOD_Browser"
        
        guard let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else {
            throw FileHandlerError.findPathError
        }
        
        guard let writePath = NSURL(fileURLWithPath: path).appendingPathComponent(folder) else {
            throw FileHandlerError.appendFolderError(folder)
        }
        
        do {
            try FileManager.default.createDirectory(atPath: writePath.path, withIntermediateDirectories: true)
        } catch {
            throw error
        }
        
        fileURL = writePath.appendingPathComponent(fileName)
    }
    
    /**
     Stores a Data object in the file at the URL created by init
     
     - parameters:
         - data: The Data object to store
     
     - throws: An error describing what went wrong
     */
    func write(_ data : Data, completion : (() throws -> Void)? = nil) throws {
        do {
            try data.write(to: fileURL)
        } catch {
            throw FileHandlerError.writeError(error.localizedDescription)
        }
        
        do {
            try completion?()
        } catch {
            throw error
        }
    }
    
    /**
     Reads data from the file at the URL created by init
     
     - returns: The Data object read from the file
     
     - throws: An error describing what went wrong
     */
    func read() throws -> Data {
        var readData : Data
        
        do {
            readData = try Data(contentsOf: fileURL)
        } catch {
            throw error
        }
        
        return readData
    }
    
    /**
     Deletes the file at the URL created by init
     
     - throws: An error describing what went wrong
     */
    func delete(completion : (() throws -> Void)? = nil) throws {
        
        do {
            try FileManager.default.removeItem(at: fileURL)
        } catch {
            throw error
        }
        
        do {
            try completion?()
        } catch {
            throw error
        }
    }
    
    func writeImage(_ image : UIImage,
                    completion : (() throws -> Void)? = nil) throws {
        
        guard let data = UIImagePNGRepresentation(image) else {
            throw FileHandlerError.conversionError("Cannot convert UIImage to Data")
        }
        
        do {
            try write(data)
        } catch {
            throw error
        }
        
        do {
            try completion?()
        } catch {
            throw error
        }
    }
    
    func readImage() throws -> UIImage {
        var data = Data()
        
        do {
            data = try read()
        } catch {
            throw error
        }
        
        guard let image = UIImage(data: data) else {
            throw FileHandlerError.conversionError("Cannot convert Data to UIImage")
        }
        
        return image
    }
}
