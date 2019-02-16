//
//  XibBased.swift
//  AutoRegistering
//
//  Created by Rob Timpone on 2/15/19.
//  Copyright © 2019 Rob Timpone. All rights reserved.
//

import UIKit

protocol XibBased: class {
    
    static var xibName: String { get }
}

extension XibBased {
    
    static var xibName: String {
        return String(describing: self)
    }
}
