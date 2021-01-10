//
//  Int+Ext.swift
//  CountryData
//
//  Created by Jeffrey Lai on 8/30/20.
//  Copyright © 2020 Jeffrey Lai. All rights reserved.
//

import Foundation

extension Int {
    var formattedWithSeparator: String {
        return Formatter.withSeparator.string(for: self) ?? ""
    }
} 
