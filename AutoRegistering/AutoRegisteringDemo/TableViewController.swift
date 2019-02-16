//
//  TableViewController.swift
//  AutoRegisteringDemo
//
//  Created by Rob Timpone on 2/16/19.
//  Copyright © 2019 Rob Timpone. All rights reserved.
//

import AutoRegistering
import UIKit

class TableViewController: UITableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(ofType: CustomTableViewCell.self)
        let nf = NumberFormatter()
        nf.numberStyle = .spellOut
        let row = NSNumber(value: indexPath.row)
        let text = nf.string(from: row) ?? "Invalid row number"
        
        cell.configure(withText: text)
        return cell
    }
}
