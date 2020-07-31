//
//  CDError.swift
//  CountryData
//
//  Created by Jeffrey Lai on 5/17/20.
//  Copyright © 2020 Jeffrey Lai. All rights reserved.
//

import Foundation

enum CDError: String, Error {
    case invalidURL = "Invalid URL"
    case invalidResponse = "Invalid Response from the server. Please try again."
    case unableToComplete = "Unable to compete your request, please check your internet connection"
    case invalidData = "The data received from the server is invalid. please try again"
}
