//
//  Currency.swift
//  CountryData
//
//  Created by Jeffrey Lai on 5/16/20.
//  Copyright © 2020 Jeffrey Lai. All rights reserved.
//

// Currency.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let currency = try? newJSONDecoder().decode(Currency.self, from: jsonData)
//
// To read values from URLs:
//
//   let task = URLSession.shared.currencyTask(with: url) { currency, response, error in
//     if let currency = currency {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - Currency
struct Currency: Codable {
    let code, name, symbol: String?
}
