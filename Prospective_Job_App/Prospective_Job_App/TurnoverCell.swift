//
//  TurnoverCell.swift
//  Prospective_Job_App
//
//  Created by Jeff Turley on 5/6/20.
//  Copyright © 2020 ilstu.edu. All rights reserved.
//

import UIKit

class TurnoverCell: UITableViewCell {
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
        
    var indName: String! {
        didSet{
            nameLabel.text = indName
        }
    }
    var turnover: Series!{
        didSet {
            guard let data = turnover.data else {
                return
            }
            numberLabel.text = "\(data[0].value)"
        }
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
