//
//  CountryVC.swift
//  CountryData
//
//  Created by Jeffrey Lai on 5/16/20.
//  Copyright © 2020 Jeffrey Lai. All rights reserved.
//

import UIKit

class CountryVC: UIViewController {
    
    var countryCollectionView: UICollectionView!
    var countryTableView: UITableView!
    var countries: [Country] = []
    let cellReuseIdentifier = "countryCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureNavBar()
        getAllCountries()
        configureTableView()
    }
    
    private func getAllCountries() {
        
        NetworkManager.shared.getAllCountries { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let countries):
                print("Countries: \(countries.count)")
                self.countries.append(contentsOf: countries)
                
                DispatchQueue.main.async {
                    self.countryTableView.reloadData()
                }
            case .failure(let error):
                print("Error Message: \(error)")
                self.presentGFAlertOnMainThread(title: "Bad Stuff Happened", message: error.rawValue, buttonTitle: "OK")
            }
        }
    }
    
    private func configure() {
        view.backgroundColor = UIColor.systemBackground
    }
    
    private func configureNavBar() {
        title = NSLocalizedString("Countries of the World", comment: "")
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = true
    }
    
    private func configureCollectionView() {
//        let flowlayout = UICollectionViewFlowLayout()
//        flowlayout.scrollDirection = .horizontal
//        flowlayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
//        flowlayout.itemSize = CGSize(width: 40, height: 40)
        
        countryCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        countryCollectionView.delegate = self
        countryCollectionView.dataSource = self
        countryCollectionView.allowsSelection = true
        countryCollectionView.backgroundColor = UIColor.systemRed
        view.addSubview(countryCollectionView)
        
        NSLayoutConstraint.activate([
            countryCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            countryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            countryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            countryCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    private func configureTableView() {
        countryTableView = UITableView(frame: view.bounds, style: .grouped)
        
        countryTableView.delegate = self
        countryTableView.dataSource = self
        countryTableView.allowsSelection = true
        countryTableView.backgroundColor = UIColor.systemBackground
        view.addSubview(countryTableView)
        
        NSLayoutConstraint.activate([
            countryTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            countryTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            countryTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            countryTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
}

extension CountryVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
}

extension CountryVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) ?? UITableViewCell()) as UITableViewCell
        cell.textLabel?.text = self.countries[indexPath.row].name
        return cell
    }
    

    

}
