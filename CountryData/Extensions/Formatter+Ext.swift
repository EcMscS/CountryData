//
//  Formatter+Ext.swift
//  CountryData
//
//  Created by Jeffrey Lai on 8/30/20.
//  Copyright © 2020 Jeffrey Lai. All rights reserved.
//

import Foundation

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        return formatter
    }()
}
