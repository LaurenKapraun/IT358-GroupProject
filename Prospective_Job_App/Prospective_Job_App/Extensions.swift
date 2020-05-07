//
//  Extensions.swift
//  Prospective_Job_App
//
//  Created by Jeff Turley on 5/2/20.
//  Copyright © 2020 ilstu.edu. All rights reserved.
//

import Foundation

extension Dictionary where Key == String {
    func searchDicKeys(str: String, verbatem: Bool?, limit: Int?) -> Dictionary<Key, Any>{
        /*let searchWords = str.components(separatedBy: " ")
        let results = self.filter({
            let keyWords = $0.key.components(separatedBy: " ")
            for sword in searchWords {
                var found = false
                for kword in keyWords {
                    found = kword.contains(sword) ? true : false
                    if found { break}
                }
                if !found { return false }
            }
            return true
        })*/
        let results = self.filter({
            return $0.key.lowercased().contains(str.lowercased())
        })
        if let lim = limit {
            var res: [String: Any] = [:]
            var i = 0
            for (key, val) in results {
                res[key] = val
                i += 1
                if( i >= lim){
                    break
                }
            }
            return res
        } else {
            return results
        }
    }
    
    func valuesAsStrings() -> [String] {
        var vals = [String]()
        for (_, val) in self {
            if let str = val as? String {
                vals.append(str)
            }
        }
        return vals
    }
}
