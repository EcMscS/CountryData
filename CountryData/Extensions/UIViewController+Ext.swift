//
//  UIViewController+Ext.swift
//  GitFollowers
//
//  Created by Jeffrey Lai on 1/8/20.
//  Copyright © 2020 Jeffrey Lai. All rights reserved.
//

import UIKit
import SafariServices



extension UIViewController {
    
    func presentGFAlertOnMainThread(title: String, message: String,  buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true, completion: nil)
        }
    }
    
    func presentSafariVC(with url: URL) {
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredControlTintColor = .systemGreen
        present(safariVC, animated: true)
    }
    
}
