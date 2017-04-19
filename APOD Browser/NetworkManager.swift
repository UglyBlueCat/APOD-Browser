//
//  NetworkManager.swift
//  APOD Browser
//
//  Created by Robin Spinks on 17/04/2017.
//  Copyright © 2017 Robin Spinks. All rights reserved.
//

import Foundation

class NetworkManager {
    
    enum Method: String {
        case GET, POST, PUT, DELETE
    }
    
    let urlSession : URLSession
    
    init() {
        self.urlSession = URLSession(configuration: .default)
    }
    
    /**
     Calls an HTTP request with the GET method
     
     - parameters:
         - params: The parameters for the GET request
         - urlString: the URL of the GET request
         - completion: A method to handle the returned data
     */
    func getRequest (params: Dictionary<String, String>,
                     urlStr: String,
                     completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        makeRequest(method: .GET,
                    params: params,
                    urlStr: urlStr,
                    completion: completion)
    }
    
    /**
     Makes an HTTP request with the provided parameters
     
     - parameters:
        - method: The method for the request
        - params: The parameters for the request
        - urlStr: the URL of the request
        - completion: A method to handle the returned data
     */
    func makeRequest(method: Method,
                     params: Dictionary<String, String>,
                     urlStr: String,
                     completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        
        if var urlComponents = URLComponents(string: urlStr) {
            
            var requestParams: [URLQueryItem] = []
            
            for (paramName, paramValue) in params {
                requestParams.append(URLQueryItem(name: paramName, value: paramValue))
            }
            
            urlComponents.queryItems = requestParams
            
            if let url : URL = urlComponents.url {
                var request : URLRequest = URLRequest(url: url)
                request.httpMethod = method.rawValue
                self.handleRequest(request: request, completion: completion)
            } else {
                DLog("Could not obtain NSURL from \(urlComponents.debugDescription)")
            }
        } else {
            DLog("Could not construct NSURLComponents from \(urlStr)")
        }
    }
    
    /**
     Handles an HTTP request of any type
     
     - parameters:
        - request: The HTTP request
        - completion: A method to handle the returned data
     */
    func handleRequest (request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        
        let task : URLSessionDataTask = urlSession.dataTask(with: request, completionHandler: completion)
        task.resume()
    }
}
