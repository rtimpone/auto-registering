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

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let text = "Section \(section)"
        let view = tableView.dequeueReusableHeader(ofType: CustomHeaderView.self)
        view.label.text = text
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = indexPath.section
        let row = indexPath.row
        let number = (section * 10) + row
        let nsnumber = NSNumber(value: number)
        
        let nf = NumberFormatter()
        nf.numberStyle = .spellOut
        let cellText = nf.string(from: nsnumber) ?? "Invalid"
        
        let cell = tableView.dequeueReusableCell(ofType: CustomTableViewCell.self)
        cell.customLabel.text = cellText
        return cell
    }
}
