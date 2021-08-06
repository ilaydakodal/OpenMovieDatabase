//
// /Users/ilaydakodal/Desktop/Workspace/OpenMovieDatabase/OpenMovieDatabase Config.swift
//  OpenMovieDatabase
//
//  Created by Ilayda Kodal on 8/3/21.
//

import Foundation

extension URL {
    static func urlForMovieApi(movie: String) -> URL! {
        return URL(string: ApiKey.baseURL + ApiKey.search + "=\(movie)&apikey=" + ApiKey.key)
    }
}

struct ApiKey {
    //http://www.omdbapi.com/?i=tt3896198&apikey=8ee98341
    static let baseURL = "http://www.omdbapi.com"
    static let search = "/?t"
    static let key = "8ee98341"
}
