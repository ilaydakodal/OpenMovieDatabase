//
//  NetworkManager.swift
//  OpenMovieDatabase
//
//  Created by Ilayda Kodal on 8/3/21.
//

import Foundation
import UIKit

final class NetworkManager {
    
    private init() { }
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, NSData>()
    
    public func getData<T: Decodable>(url: URL?, completion: @escaping ((NetworkResult<T>) -> Void)) {
        guard let url = url else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data,response,error) in
            guard error == nil else {
                completion(.failure(.failedSession))
                return
            }
            
            if let data = data, let response = response as? HTTPURLResponse {
                if response.statusCode == 200 {
                    do {
                        let decoder = JSONDecoder()
                        let decoded = try decoder.decode(T.self, from: data)
                        completion(.success(decoded))
                    } catch {
                        completion(.failure(.invalidResponse))
                    }
                }
            } else {
                completion(.failure(.unknown))
            }
        }
        task.resume()
    }
}
