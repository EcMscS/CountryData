//
//  CountryTableViewCell.swift
//  CountryData
//
//  Created by Jeffrey Lai on 8/4/20.
//  Copyright © 2020 Jeffrey Lai. All rights reserved.
//

import UIKit
import SwiftDraw

class CountryTableViewCell: UITableViewCell {

    static let reuseID = "CountryCell"
    let flagImageView = CDFlagImgeView(frame: .zero)
    let countryNameLabel = GFTitleLabel(textAlignment: .left, fontSize: 15)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(country: Country) {
        countryNameLabel.text = country.name
        
        NetworkManager.shared.downloadFlagImage(from: country.flag) { [weak self] (image) in
            guard let self = self else { return }

            DispatchQueue.main.async {
                self.flagImageView.image = image
            }
        }
    }
    
    func configure() {
        self.addSubviews(flagImageView, countryNameLabel)
        flagImageView.backgroundColor = .systemGray6
        flagImageView.contentMode = .scaleAspectFit

        accessoryType = .disclosureIndicator
        let padding: CGFloat = 15

        NSLayoutConstraint.activate([
            flagImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            flagImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            flagImageView.widthAnchor.constraint(equalToConstant: 75),
            flagImageView.heightAnchor.constraint(equalToConstant: 50),

            countryNameLabel.leadingAnchor.constraint(equalTo: flagImageView.trailingAnchor, constant: 10),
            countryNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            countryNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            countryNameLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
