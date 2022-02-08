//
//  UIViewController+Extension.swift
//  SpaceXLaunches
//
//  Created by alaattinbulut on 6.02.2022.
//

import UIKit

extension UIViewController {
    func showPopup(withTitle title: String, message : String, OkHandler: @escaping (() -> Void) = {}) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { _ in
            OkHandler()
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

