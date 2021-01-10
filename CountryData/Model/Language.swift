//
//  Language.swift
//  CountryData
//
//  Created by Jeffrey Lai on 5/16/20.
//  Copyright © 2020 Jeffrey Lai. All rights reserved.
//

// Language.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let language = try? newJSONDecoder().decode(Language.self, from: jsonData)
//
// To read values from URLs:
//
//   let task = URLSession.shared.languageTask(with: url) { language, response, error in
//     if let language = language {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - Language
struct Language: Codable {
    let iso6391: String?
    let iso6392, name, nativeName: String

    enum CodingKeys: String, CodingKey {
        case iso6391 = "iso639_1"
        case iso6392 = "iso639_2"
        case name, nativeName
    }
}
