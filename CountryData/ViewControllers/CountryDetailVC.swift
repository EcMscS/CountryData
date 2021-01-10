//
//  CountryDetailVC.swift
//  CountryData
//
//  Created by Jeffrey Lai on 8/1/20.
//  Copyright © 2020 Jeffrey Lai. All rights reserved.
//

import UIKit
import SwiftUI

//Infor to display:
//name, capital, region, subregion, population, latlng, area, currency.code, currency.symbol, flag(url)

class CountryDetailVC: UIViewController {
    
    let hostingController = UIHostingController(rootView: CountryDetailView())
    
    var country: Country?
    let countryDetailTableView = UITableView()
    var dataToDisplay: [String:Any] = [:]
    let cellReuseIdentifier = "countryCell"
    
    let flagImageView = UIImageView()
    
    init(country: Country) {
        super.init(nibName: nil, bundle: nil)
        self.country = country
        title = country.name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        extractCountryData()
        configureTableView()
    }
    
    func configure() {
        view.backgroundColor = .systemBackground
    }
    
    func extractCountryData() {
        dataToDisplay["Name"] = country?.name
        dataToDisplay["Capital"] = country?.capital
        dataToDisplay["Region"] = country?.region.rawValue
        dataToDisplay["Subregion"] = country?.subregion
        dataToDisplay["Population"] = country?.population
        dataToDisplay["Latitude:Longitude"] = country?.latlng
        dataToDisplay["Area"] = country?.area
        dataToDisplay["Currencies"] = country?.currencies //Multiple Currencies
        dataToDisplay["Flag"] = country?.flag //Flag URL
    }
    
    private func configureFlagImage() {
        view.addSubview(flagImageView)
        flagImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            flagImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            flagImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            flagImageView.bottomAnchor.constraint(equalTo: countryDetailTableView.topAnchor)
        ])
    }
    
    private func configureTableView() {
        view.addSubview(flagImageView)
        getFlag()
        flagImageView.contentMode = .scaleAspectFit
        flagImageView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(countryDetailTableView)
        //countryDetailTableView.frame = view.bounds
        countryDetailTableView.delegate = self
        countryDetailTableView.dataSource = self
        countryDetailTableView.allowsSelection = false
        countryDetailTableView.backgroundColor = UIColor.systemBackground
        countryDetailTableView.rowHeight = 60
        countryDetailTableView.translatesAutoresizingMaskIntoConstraints = false
        countryDetailTableView.removeExcessCells()
        countryDetailTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
 
        view.bringSubviewToFront(flagImageView)
        
        NSLayoutConstraint.activate([
            flagImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            flagImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            flagImageView.heightAnchor.constraint(equalToConstant: 200),
            flagImageView.bottomAnchor.constraint(equalTo: countryDetailTableView.topAnchor, constant: -20),
            
            countryDetailTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            countryDetailTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            countryDetailTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    private func getFlag() {
        NetworkManager.shared.downloadFlagImage(from: country!.flag) { [weak self] (image) in
            guard let self = self else { return }

            DispatchQueue.main.async {
                self.flagImageView.image = image
            }
        }
    }
}

extension CountryDetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) ?? UITableViewCell()) as UITableViewCell
       
        if indexPath.row == 0 {
            cell.textLabel?.text = "Capital: \(country!.capital)"
        } else if indexPath.row == 1 {
            cell.textLabel?.text = "Region: \(country!.region.rawValue)"
        } else if indexPath.row == 2 {
            cell.textLabel?.text = "Subregion: \(country!.subregion)"
        } else if indexPath.row == 3 {
            let formattedPopulation = country!.population.formattedWithSeparator
            cell.textLabel?.text = "Population: \(formattedPopulation)"
        } else if indexPath.row == 4 {
            cell.textLabel?.text = "Latitude / Longitude: \(country!.latlng)"
        } else if indexPath.row == 5 {
            let formattedArea = country!.area?.formattedWithSeparator
            cell.textLabel?.text = "Area of Country: \(formattedArea!)"
        } else {
            cell.textLabel?.text = ""
        }
        
        cell.textLabel?.textAlignment = .center

        return cell
    }
    

}



