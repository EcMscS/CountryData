//
//  NetworkManager.swift
//  CountryData
//
//  Created by Jeffrey Lai on 5/17/20.
//  Copyright © 2020 Jeffrey Lai. All rights reserved.
//

import UIKit
import Foundation
import SwiftDraw

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
                let countries = try decoder.decode([Country].self, from: data)
                completed(.success(countries))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    func downloadFlagImage(from urlString: String, completed: @escaping(UIImage?) -> Void) {
        
        let cacheKey = NSString(string: urlString)
       
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            
            guard let flagImage = Image(fileURL: url) else {
                return
            }
            
            //Error Checking
            guard let self = self,
                error == nil,
                let response = response as? HTTPURLResponse, response.statusCode == 200,
                let _ = data,
                let image = flagImage.pdfImage() else {
                    completed(nil)
                    return
                }
            
            //Set image into cache
            self.cache.setObject(image, forKey: cacheKey)
            
            completed(image)
        }
        task.resume()
    }
}


