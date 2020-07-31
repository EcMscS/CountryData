//
//  NetworkManager.swift
//  CountryData
//
//  Created by Jeffrey Lai on 5/17/20.
//  Copyright © 2020 Jeffrey Lai. All rights reserved.
//

import UIKit
import Foundation

class NetworkManager {
    
    //Search by Name: https://restcountries.eu/rest/v2/name/{name}
    //Search all countries: https://restcountries.eu/rest/v2/all
    
    static let shared = NetworkManager()
    
    //Construct URL by assignin its parts to a URLComponents value
    private var components = URLComponents()
    private let scheme = "https"
    private let host = "restcountries.eu"
    private let pathAllCountries = "/rest/v2/all"
    
    private let countriesURL = "https://restcountries.eu/rest/v2/all"
    
    let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func getAllCountries(completed: @escaping(Result<[Country], CDError>) -> Void) {
        
        //Construct URL
        guard let url = URL(string: countriesURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        //URLSession to create data task
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let _ = error {
                print("Error Message is \(String(describing: error))")
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
        
            guard let data = data else {
                print("Data is invalid; \(String(describing: error))")
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                //decoder.keyDecodingStrategy = .convertFromSnakeCase
                let countries = try decoder.decode([Country].self, from: data)
                print("Number of Countries: \(countries.count)")
                completed(.success(countries))
            } catch {
                print("Data is invalid; \(String(describing: error))")
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }

    
}
