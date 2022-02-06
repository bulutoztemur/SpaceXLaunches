//
//  UIViewController+Extension.swift
//  SpaceXLaunches
//
//  Created by alaattinbulut on 6.02.2022.
//

import UIKit

extension UIViewController {
    func showPopup(withTitle title: String, message : String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) 
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

