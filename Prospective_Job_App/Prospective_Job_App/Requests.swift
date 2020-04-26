//
//  Requests.swift
//  Prospective_Job_App
//
//  Created by Jeff Turley on 4/21/20.
//  Copyright © 2020 ilstu.edu. All rights reserved.
//

import Foundation

let DOL_URL = "https://data.dol.gov"///v2"
let DOL_KEY = "7a44b590-6c8d-407a-886a-42a25042c85a"
let BLS_URL = "https://api.bls.gov/publicAPI/v2"
let BLS_KEY = "9b81a60a1fa647b6a726be9000d176a1"

class DOLRequest: CustomRequest {
    
    var format: String
    var method: String
    var table: String
    
    init(method: String, table: String){
        self.method = method
        self.format = "JSON"
        self.table = table
        super.init(api_url: DOL_URL)
        header(key: "X-API-KEY", val: DOL_KEY)
    }
    
    override func handlerFunc(_ data: Data, _ response: URLResponse?, _ error: Error?) {
        super.handlerFunc(data, response, error)
    }
    override func urlString() -> String {
        return super.urlString()
    }
    override func argumentString() -> String {
        return super.argumentString()
    }
}

class BLSRequest: CustomRequest {
    //http://danstrong.tech/blog/BLS-API/
    //tutorial on using BLS API
    var format: String
    
    init(){
        self.format = "JSON"
        super.init(api_url: BLS_URL)
        header(key: "X-API-KEY", val: BLS_KEY)
    }
    
    override func handlerFunc(_ data: Data, _ response: URLResponse?, _ error: Error?) {
        return
    }
    override func urlString() -> String {
        return ""
    }
    override func argumentString() -> String {
        return ""
    }
}
