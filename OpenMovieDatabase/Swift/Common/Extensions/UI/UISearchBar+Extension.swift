//
//  UISearchBar+Extension.swift
//  OpenMovieDatabase
//
//  Created by Ilayda Kodal on 8/4/21.
//

import UIKit

extension UISearchBar {
    
    private var textField: UITextField? {
        let subViews = self.subviews.flatMap { $0.subviews }
        return (subViews.filter { $0 is UITextField }).first as? UITextField
    }
    
    private var searchIcon: UIImage? {
        let subViews = subviews.flatMap { $0.subviews }
        return  ((subViews.filter { $0 is UIImageView }).first as? UIImageView)?.image
    }

    private var activityIndicator: UIActivityIndicatorView? {
        return textField?.leftView?.subviews.compactMap{ $0 as? UIActivityIndicatorView }.first
    }
    
    //MARK: - Public API
    
    var isLoading: Bool {
        get {
            return activityIndicator != nil
        } set {
            let searchIcon = searchIcon
            if newValue {
                if activityIndicator == nil {
                    let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
                    activityIndicator.startAnimating()
                    activityIndicator.backgroundColor = UIColor.clear
                    self.setImage(UIImage(), for: .search, state: .normal)
                    textField?.leftView?.addSubview(activityIndicator)
                    let leftViewSize = textField?.leftView?.frame.size ?? CGSize.zero
                    activityIndicator.center = CGPoint(x: leftViewSize.width/2, y: leftViewSize.height/2)
                }
            } else {
                self.setImage(searchIcon, for: .search, state: .normal)
                activityIndicator?.removeFromSuperview()
            }
        }
    }
}
