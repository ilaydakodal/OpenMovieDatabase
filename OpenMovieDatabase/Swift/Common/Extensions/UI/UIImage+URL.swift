//
//  UIImage+URL.swift
//  OpenMovieDatabase
//
//  Created by Ilayda Kodal on 8/4/21.
//

import UIKit

extension UIImageView {
    
    func setImageFromURL(url: URL) {
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })
        }).resume()
    }
}
