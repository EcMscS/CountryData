//
//  UITableView+Ext.swift
//  GitFollowers
//
//  Created by Jeffrey Lai on 2/13/20.
//  Copyright © 2020 Jeffrey Lai. All rights reserved.
//

import UIKit

extension UITableView {
    
    func reloadDataOnMainThread() {
        DispatchQueue.main.async { self.reloadData() }
    }
    
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
    
}
