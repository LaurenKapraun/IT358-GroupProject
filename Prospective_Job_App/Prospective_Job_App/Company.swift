//
//  Company.swift
//  Prospective_Job_App
//
//  Created by Jeff Turley on 4/14/20.
//  Copyright © 2020 ilstu.edu. All rights reserved.
//

import Foundation
import UIKit

struct Company: Codable{
    
    var title: String
    var subtitle: String
    var location: String
    var about: String
    var rating: Double
    
    //still trying to find the proper data tables
    //keys may be updated to match JSON replies
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case subtitle = "subtitile"
        case location = "location"
        case about = "about"
        case rating = "rating"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decode(String.self, forKey: .title)
        subtitle = try values.decode(String.self, forKey: .subtitle)
        location = try values.decode(String.self, forKey: .location)
        about = try values.decode(String.self, forKey: .about)
        rating = try values.decode(Double.self, forKey: .rating)
    }
}


class CompanyCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    var company: Company? {
        didSet{
            if let val = company {
                titleLabel.text = val.title
                subtitleLabel.text = val.subtitle
                locationLabel.text = val.location
                ratingLabel.text = "\(val.rating)"
            }
        }
    }
    
}
