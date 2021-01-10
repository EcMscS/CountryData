//
//  CDFlagImgeView.swift
//  CountryData
//
//  Created by Jeffrey Lai on 8/4/20.
//  Copyright © 2020 Jeffrey Lai. All rights reserved.
//

import UIKit

class CDFlagImgeView: UIImageView {

    let cache = NetworkManager.shared.cache
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 3
        clipsToBounds = true
        contentMode = .scaleAspectFit
        backgroundColor = .systemBackground
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
