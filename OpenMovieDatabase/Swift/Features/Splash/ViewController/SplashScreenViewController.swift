//
//  SplashScreenViewController.swift
//  OpenMovieDatabase
//
//  Created by Ilayda Kodal on 8/6/21.
//


import UIKit
import Firebase
import NVActivityIndicatorView

class SplashScreenViewController: UIViewController {
    
    @IBOutlet weak var splashImageView: UIImageView!
    @IBOutlet weak var splashLogoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkNetwork()
    }
    
    func checkNetwork() {
        self.splashImageView.isHidden = true
        
        if NetworkMonitor.shared.isConnected == false {
            self.splashImageView.isHidden = false
            self.splashLogoLabel.text = "No internet Connection"
            
        } else {
            splashLogoLabel.text = config.splashScreenName
            startAnimating()
            Foundation.Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { timer in
                if NetworkMonitor.shared.isConnected {
                    print("Connected")
                    timer.invalidate()
                    self.performSegue(withIdentifier: "mainPage", sender: nil)
                }
            }
        }
    }
        
        fileprivate func startAnimating() {
            let loading = NVActivityIndicatorView(frame: .zero,
                                                  type: .ballPulse,
                                                  color: #colorLiteral(red: 0.231372549, green: 0.6823529412, blue: 0.7529411765, alpha: 0.85),
                                                  padding: 0)
            loading.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(loading)
            NSLayoutConstraint.activate([
                loading.widthAnchor.constraint(equalToConstant: 80),
                loading.heightAnchor.constraint(equalToConstant: 80),
                loading.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                loading.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ])
            loading.startAnimating()
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime .now() + 3) {
                loading.startAnimating()
            }
        }
    }
