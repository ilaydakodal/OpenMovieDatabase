//
//  UIViewController+ActivityIndicator.swift
//  OpenMovieDatabase
//
//  Created by Ilayda Kodal on 8/6/21.
//

import UIKit

fileprivate var activityView: UIView?

extension UIViewController {
    func showSpinner() {
        activityView = UIView(frame:  self.view.bounds)
        activityView?.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.4)
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.center = activityView!.center
        activityIndicator.startAnimating()
        activityView?.addSubview(activityIndicator)
        self.view.addSubview(activityView!)
    }
    
    func stopSpinner() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            activityView?.removeFromSuperview()
            activityView = nil
        }
    }
}
