//
//  Salary.swift
//  Prospective_Job_App
//
//  Created by Jeff Turley on 4/14/20.
//  Copyright © 2020 ilstu.edu. All rights reserved.
//

import Foundation
import UIKit


enum SalaryType {
    case hourly
    case contract
    case yearly
}


struct Salary: Codable {
    
    var average: Double
    var lower: Double
    var upper: Double
    var type: String
    
    //still trying to find the proper data tables
    //keys may be updated to match JSON replies
    enum CodingKeys: String, CodingKey {
        case average = "average"
        case lower = "lower"
        case upper = "upper"
        case type = "type"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        average = try values.decode(Double.self, forKey: .average)
        lower = try values.decode(Double.self, forKey: .lower)
        upper = try values.decode(Double.self, forKey: .upper)
        type = try values.decode(String.self, forKey: .type)
    }
    
    func formatCurrency(amount: Double) -> String {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currencyAccounting
        formatter.locale = Locale.current
        return formatter.string(from: NSNumber(value: amount))!
    }
}


class SalaryCell: UITableViewCell {
    
    @IBOutlet weak var averageLabel: UILabel!
    @IBOutlet weak var lowerLabel: UILabel!
    @IBOutlet weak var upperLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
        
    var salary: Salary? {
        didSet{
            if let val = salary {
                averageLabel.text = "\(val.average)"
                lowerLabel.text = "\(val.lower)"
                upperLabel.text = "\(val.upper)"
                typeLabel.text = val.type
            }
        }
    }
}
