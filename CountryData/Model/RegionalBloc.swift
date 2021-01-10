//
//  RegionalBloc.swift
//  CountryData
//
//  Created by Jeffrey Lai on 8/1/20.
//  Copyright © 2020 Jeffrey Lai. All rights reserved.
//

// RegionalBloc.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let regionalBloc = try? newJSONDecoder().decode(RegionalBloc.self, from: jsonData)
//
// To read values from URLs:
//
//   let task = URLSession.shared.regionalBlocTask(with: url) { regionalBloc, response, error in
//     if let regionalBloc = regionalBloc {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - RegionalBloc
struct RegionalBloc: Codable {
    let acronym: Acronym
    let name: Name
    let otherAcronyms: [OtherAcronym]
    let otherNames: [OtherName]
}
