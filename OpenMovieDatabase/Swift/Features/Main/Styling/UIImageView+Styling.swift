//
//  ReusableCell+Styling.swift
//  OpenMovieDatabase
//
//  Created by Ilayda Kodal on 8/6/21.
//

import UIKit

extension UIImageView {
    
    func applyDefaultStyling() {
        let w = layer.bounds.width
        let h = layer.bounds.height
        let activityView = UIActivityIndicatorView()
        activityView.style = .medium
        image = UIImage()
        backgroundColor = .gray
        layer.cornerRadius = 10
        clipsToBounds = true
        addSubview(activityView)
        activityView.center = CGPoint(x: w / 2, y: h / 2)
        activityView.startAnimating()
    }
}
