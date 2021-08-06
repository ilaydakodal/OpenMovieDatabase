//
//  RemoteConfiguration.swift
//  OpenMovieDatabase
//
//  Created by Ilayda Kodal on 8/6/21.
//

import Foundation
import Firebase

struct config {
    
    static var splashScreenName: String {
        get {
            return UserDefaults.standard.string(forKey: "splashScreenName") ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "splashScreenName")
        }
    }
}

class RemoteConfiguration {
    
    static func getRemoteConfig(completion: @escaping(_ success: Bool, _ error: String) -> Void) {

        let remoteConfig = Firebase.RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
        
        remoteConfig.fetchAndActivate { (status, error) in
            
            if status != .error {
                let splashScreenName = remoteConfig["splash_screen_name"].stringValue
                config.splashScreenName = splashScreenName!
                completion(true,"")
            } else {
                completion(false, error!.localizedDescription)
            }
        }
    }
}
