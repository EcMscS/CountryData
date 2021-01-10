//
//  Country.swift
//  CountryData
//
//  Created by Jeffrey Lai on 5/16/20.
//  Copyright © 2020 Jeffrey Lai. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let country = try? newJSONDecoder().decode(Country.self, from: jsonData)
//
// To read values from URLs:
//
//   let task = URLSession.shared.welcomeElementTask(with: url) { data, response, error in
//     if let data = data {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - Country
struct Country: Codable {
    let name: String
    let topLevelDomain: [String]
    let alpha2Code, alpha3Code: String
    let callingCodes: [String]
    let capital: String
    let altSpellings: [String]
    let region: Region
    let subregion: String
    let population: Int
    let latlng: [Double]
    let demonym: String
    let area, gini: Double?
    let timezones, borders: [String]
    let nativeName: String
    let numericCode: String?
    let currencies: [Currency]
    let languages: [Language]
    let translations: Translations
    let flag: String
    let regionalBlocs: [RegionalBloc]
    let cioc: String?
}
