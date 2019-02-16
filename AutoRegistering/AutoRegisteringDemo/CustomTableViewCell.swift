//
//  CustomTableViewCell.swift
//  AutoRegisteringDemo
//
//  Created by Rob Timpone on 2/16/19.
//  Copyright © 2019 Rob Timpone. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var customLabel: UILabel!
    
    func configure(withText text: String) {
        customLabel.text = text
    }
}
