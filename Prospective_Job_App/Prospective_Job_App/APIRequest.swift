//
//  APIRequest.swift
//  Prospective_Job_App
//
//  Created by Jeff Turley on 4/16/20.
//  Copyright © 2020 ilstu.edu. All rights reserved.
//

import Foundation


protocol Tasker {
    func urlString() -> String
    func argumentString() -> String
    func handlerFunc(_ data: Data, _ response: URLResponse?, _ error: Error?) -> Void
}


class CustomRequest: NSObject, URLSessionDelegate, Tasker {
    var config = URLSessionConfiguration.default
    var timeout: Double {
        get{ return config.timeoutIntervalForRequest }
        set(value){ config.timeoutIntervalForRequest = value }
    }
    var url_root: String
    var arguments = Dictionary <String, String>()
    var headers = Dictionary <String, String>()
    
    func header(key: String) -> String { return headers[key]! }
    func header(key: String, val: String) -> Void { headers[key] = val }
    func argument(key: String) -> String { return arguments[key]! }
    func argument(key: String, val: String) -> Void { arguments[key] = val }
    
    var url: URL? {
        get{
            var str = urlString()
            str += argumentString()
            return URL(string: str)
        }
    }
    var session: URLSession {
        get{
            return URLSession(configuration: config, delegate: self, delegateQueue: OperationQueue.main)
        }
    }
    
    init(api_url: String){
        url_root = api_url
        super.init()
        timeout = 60.0
    }
    
    func call(){
        guard let url = url else {
            return
        }
        let request = NSMutableURLRequest(url: url)
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
        print(url.absoluteString)
        //create and send task
        let task = session.dataTask(with: request as URLRequest,
            completionHandler: { data, response, error in
                guard error == nil else {
                    print("error calling GET method")
                    print(error!)
                    return
                }
                guard let respData = data else {
                    print("Error: did not receive data")
                    return
                }
                self.handlerFunc(respData, response, error)
            }
        )
        task.resume()
    }
    
    func urlString() -> String {
        return url_root
    }
    
    func argumentString() -> String {   //Override for other api requests
        var str = ""
        for (argKey, argValue) in arguments {
            str += "/" + argKey + "/" + argValue
        }
        return str
    }
    
    func handlerFunc(_ data: Data, _ response: URLResponse?, _ error: Error?) {
        return
    }
}
