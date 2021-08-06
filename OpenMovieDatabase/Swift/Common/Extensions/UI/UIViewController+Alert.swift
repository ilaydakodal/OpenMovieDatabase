//
//  UIViewController+Alert.swift
//  OpenMovieDatabase
//
//  Created by Ilayda Kodal on 8/6/21.
//

import UIKit

extension UIViewController{
    
    func presentWarningAlert(_ message: String) {
        let alertController = UIAlertController(title: "Oops!",
                                                message: message,
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK",
                                                style: .default,
                                                handler: nil))
        self.present(alertController,
                     animated: true,
                     completion: nil)
    }
}
