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
    var table: String
    
    init(method: String, table: String){
        self.table = table
        super.init(api_host: DOL_URL, path: table, method: method)
        header(key: "X-API-KEY", val: DOL_KEY)
    }
    
    /*override func handlerFunc(_ data: Data, _ response: URLResponse?, _ error: Error?) {
        print(String(decoding: data, as: UTF8.self))
        do {
            guard let todo = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] else {
                print("error trying to convert data to JSON")
                return
            }
          // now we have the todo let's just print it to prove we can access it
            print("The todo is: " + todo.description)
          
          // the todo object is a dictionary so we just access the title using the "title" key so check for a title and print it if we have one
            guard let todoTitle = todo[0/*"title"*/] as [String: Any]? else {
                print("Could not get todo title from JSON")
                return
            }
            print("The title is: " + todoTitle.description)
        }
        catch  {
            print("error trying to convert data to JSON")
            return
        }
    }*/
    
    override func urlString() -> String {
        return host + "/" + method.lowercased() + "/" + path + queryString()
    }
    
    override func queryString() -> String {
        var str = "/"
        for (queryKey, queryValue) in queries {
            str += queryKey + "/" + queryValue + "/"
        }
        return str
    }
    
    override func bodyData() -> Data? {
        return nil
    }
}
