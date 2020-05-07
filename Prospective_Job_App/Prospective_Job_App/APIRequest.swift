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
    func queryString() -> String
    func bodyData() -> Data?
    //func handlerFunc(_ data: Data, _ response: URLResponse?, _ error: Error?) -> Void
    //func packRequest() -> NSMutableURLRequest?
}

class CustomRequest: NSObject, URLSessionDelegate, Tasker {
    var host: String = ""
    var path: String = ""
    var format: String = "JSON"
    var queries = Dictionary <String, String>()
    var headers = Dictionary <String, String>()
    
    var config = URLSessionConfiguration.default
    var timeout: Double {
        get{ return config.timeoutIntervalForRequest }
        set(value){ config.timeoutIntervalForRequest = value }
    }
    func header(key: String) -> String { return headers[key]! }
    func header(key: String, val: String) -> Void { headers[key] = val }
    func query(key: String) -> String { return queries[key]! }
    func query(key: String, val: String) -> Void { queries[key] = val }
    var method: String {
        set(val){ method_capped = val.uppercased() }
        get { return method_capped }
    }
    private var method_capped: String = ""
    var url: URL? {
        get{ return URL(string: urlString()) }
    }
    var url_str: String? {
        get{ return url?.absoluteString }
    }
    var session: URLSession {
        get{
            return URLSession(configuration: config, delegate: self, delegateQueue: OperationQueue.main)
        }
    }
    
    init(api_host: String, path: String?, method: String){
        self.host = api_host
        self.path = path ?? ""
        super.init()
        self.method = method
        timeout = 60.0
    }
    
    func call(handler: @escaping (Data?, URLResponse?, Error?) -> Void){
        guard let request = request else { return }
        //create and send task
        let task = session.dataTask(with: request as URLRequest,
                                    completionHandler: handler
            /*completionHandler: { data, response, error in
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
            }*/
    
        )
        task.resume()
    }
    var request: NSMutableURLRequest? {
        guard let url = url else {  return nil  }
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = method.uppercased()
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
        if method != "GET" {
            request.httpBody = bodyData()
        }
        return request
    }
    
    /*func packRequest() -> NSMutableURLRequest?{
        guard let url = url else {  return nil  }
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = method.uppercased()
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
        if method != "GET" {
            request.httpBody = bodyData()
        }
        return request
    }*/
    
    func urlString() -> String {
        return host + "/" + path + "/" + queryString()
    }
    
    func queryString() -> String {   //Override for other api requests
        return ""
    }
    
    func bodyData() -> Data?{
        return nil
    }
    
    /*func handlerFunc(_ data: Data, _ response: URLResponse?, _ error: Error?) {
        return
    }*/
}
