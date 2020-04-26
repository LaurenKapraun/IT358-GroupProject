//
//  Job.swift
//  Prospective_Job_App
//
//  Created by Jeff Turley on 4/14/20.
//  Copyright © 2020 ilstu.edu. All rights reserved.
//

import Foundation
import UIKit

struct Job: Codable{
    
    var title: String
    var subtitle: String
    var level: String
    var company: Company
    var about: String
    var salary: Salary
    
    //still trying to find the proper data tables
    //keys may be updated to match JSON replies
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case subtitle = "subtitle"
        case level = "level"
        case company = "company"
        case about = "about"
        case salary = "salary"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decode(String.self, forKey: .title)
        subtitle = try values.decode(String.self, forKey: .subtitle)
        level = try values.decode(String.self, forKey: .level)
        company = try values.decode(Company.self, forKey: .company)
        about = try values.decode(String.self, forKey: .about)
        salary = try values.decode(Salary.self, forKey: .salary)
    }
}


class JobCell: UITableViewCell{
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    var job: Job? {
        didSet{
            if let val = job {
                titleLabel.text = val.title
                subtitleLabel.text = val.subtitle
            }
        }
    }
    
    
}
