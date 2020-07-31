//
//  Country.swift
//  CountryData
//
//  Created by Jeffrey Lai on 5/16/20.
//  Copyright © 2020 Jeffrey Lai. All rights reserved.
//

import Foundation

struct Country: Codable {
    let name: String
    let capital: String
    let region: String
    let population: Int
    let nativeName: String
    let flag: String //URL for Country Flas
    //let currencies: [Currency]
    //let languanges: [Language]
    let latlng: [Double]
}
