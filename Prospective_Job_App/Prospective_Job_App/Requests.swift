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
    
    override func handlerFunc(_ data: Data, _ response: URLResponse?, _ error: Error?) {
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
    }
    
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

class BLSRequest: CustomRequest {
    //http://danstrong.tech/blog/BLS-API/
    //tutorial on using BLS API
    var body = Dictionary<String, Any>()
    var series: [String]? {
        get{
            guard let list = body["seriesid"] as? [String], list.count > 0 else {
                return nil
            }
            return list
        }
        set(val){
            body["seriesid"] = val
        }
    }
    var startyear: String? {
        get{ return body["startyear"] as? String }
    }
    var endyear: String? {
        get{ return body["endyear"] as? String }
    }
    var catalog: Bool? {
        get{ return body["catalog"] as? Bool }
    }
    var calculations: Bool? {
       get{ return body["calculations"] as? Bool }
    }
    var annualaverage: Bool? {
       get{ return body["annualaverage"] as? Bool }
    }
    
    init(method: String, path: String){
        super.init(api_host: BLS_URL, path: path, method: method)
        header(key: "Content-Type", val: "application/json")
        body.updateValue(BLS_KEY, forKey: "registrationKey")
    }
    
    override func handlerFunc(_ data: Data, _ response: URLResponse?, _ error: Error?) {
        print(String(decoding: data, as: UTF8.self))
        do {
            print("BP1")
            print(data.description)
            print("BP2")
            guard let todo = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                print("----error trying to convert data to JSON")
                return
            }
            print("BP3")
            for (key, val) in todo {
                print("---------------------------------------------------")
                print("key : \(key)")
                if let array = val as? [Any] {
                    for v1 in array {
                        if let a1 = v1 as? [Any] {
                            for v2 in a1 {
                                print("\(v2)")
                            }
                        }
                        else {
                            print("----error parsing \(key) to array")
                        }
                        
                        if let dic = val as? [String: Any] {
                            for (k2, v2) in dic {
                                print("<\(k2) : \(v2)>")
                            }
                        }
                        else {
                            print("----Error parsing \(key) to dictionary")
                        }
                    }
                }
                else{
                    print("----error parsing \(key) to array")
                }

                if let dic = val as? [String: Any] {
                    for (k1, v1) in dic {
                        print("\(k1) : ")
                        if let d2 = v1 as? [String: Any] {
                            for (k2, v2) in d2 {
                                print("\(k2):\(v2)")
                            }
                        }
                        else{
                            print("----error parsing \(k1) to dictionary")
                        }
                        
                        if let a2 = v1 as? [Any] {
                            for v2 in a2 {
                                print("\(v2)")
                            }
                        }
                        else{
                            print("----error parsing \(k1) to array")
                        }
                    }
                }
                else {
                    print("----Error parsing \(key) to dictionary")
                }
                //print("---------------------------------------------------")
                
                
            }
            print("BP4")
          // now we have the todo let's just print it to prove we can access it
            //for r in res {
                //print("\(k) : \(r)")
                /*if let (k, s) = t as? (String, Any) {
                    print(k.description + " : " + "\(s)")
                }
                else{
                    print("type not a dictionary")
                }*/
            //}
            print("BP5")
          /*
          // the todo object is a dictionary so we just access the title using the "title" key so check for a title and print it if we have one
            guard let todoTitle = todo[0/*"title"*/] as [String: Any]? else {
                print("Could not get todo title from JSON")
                return
            }
            print("The title is: " + todoTitle.description)
 */
        }
        catch  {
            print("error trying to convert data to JSON")
            return
        }
    }
    
    override func queryString() -> String {
        super.queryString()
    }
    
    override func bodyData() -> Data? {
        guard let data = try? JSONSerialization.data(withJSONObject: body, options: []) else {
            return nil
        }
        return data
    }
}
