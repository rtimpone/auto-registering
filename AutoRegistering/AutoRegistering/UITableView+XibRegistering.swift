//
//  UITableView+XibRegistering.swift
//  AutoRegistering
//
//  Created by Rob Timpone on 2/15/19.
//  Copyright © 2019 Rob Timpone. All rights reserved.
//

import UIKit

protocol XibRegistering {
    
    func hasRegisteredType<T: XibBased>(_ type: T.Type) -> Bool
    func registerType<T: XibBased>(_ type: T.Type)
}

extension UITableView: XibRegistering {
    
    func hasRegisteredType<T: XibBased>(_ type: T.Type) -> Bool {
        guard let registeredCells = registeredCells else {
            return false
        }
        return registeredCells.contains(type.xibName)
    }
    
    func registerType<T: XibBased>(_ type: T.Type) {
        
        let xibName = type.xibName
        let bundle = Bundle(for: type)
        let nib = UINib(nibName: xibName, bundle: bundle)
        register(nib, forCellReuseIdentifier: xibName)
        
        if registeredCells == nil {
            registeredCells = Set<String>()
        }
        registeredCells?.insert(type.xibName)
    }
}

extension UITableViewCell: XibBased {
    
    // make all table view cells xib based by default
}

private extension UITableView {
    
    struct AssociatedKeys {
        static var registeredNibBasedCells = "kRegisteredNibBasedCells"
    }
    
    //this allows us to add a stored property of type Set<String> to all UITableViews via an extension
    var registeredCells: Set<String>? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.registeredNibBasedCells) as? Set<String>
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedKeys.registeredNibBasedCells, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
}

public extension UITableView {
    
    public func dequeueReusableCell<T: UITableViewCell>(ofType type: T.Type) -> T {
        
        if !hasRegisteredType(type) {
            registerType(type)
        }
        
        let identifier = type.xibName
        guard let cell = dequeueReusableCell(withIdentifier: identifier) else {
            fatalError("Unable to dequeue reusable cell with identifier '\(identifier)'")
        }
        
        guard let typedCell = cell as? T else {
            fatalError("Cell that was dequeued for identifier '\(identifier)' could not be casted to type '\(String(describing: type))'")
        }
        
        return typedCell
    }
}
