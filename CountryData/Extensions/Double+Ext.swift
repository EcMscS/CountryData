//
//  Double+Ext.swift
//  CountryData
//
//  Created by Jeffrey Lai on 9/2/20.
//  Copyright © 2020 Jeffrey Lai. All rights reserved.
//

import Foundation

extension Double {
    var formattedWithSeparator: String {
        return Formatter.withSeparator.string(for: self) ?? ""
    }
}
