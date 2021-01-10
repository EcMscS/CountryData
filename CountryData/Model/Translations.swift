//
//  Translations.swift
//  CountryData
//
//  Created by Jeffrey Lai on 8/1/20.
//  Copyright © 2020 Jeffrey Lai. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let translations = try? newJSONDecoder().decode(Translations.self, from: jsonData)
//
// To read values from URLs:
//
//   let task = URLSession.shared.translationsTask(with: url) { translations, response, error in
//     if let translations = translations {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - Translations
struct Translations: Codable {
    let de, es, fr, ja: String?
    let it: String?
    let br, pt: String
    let nl, hr: String?
    let fa: String
}
