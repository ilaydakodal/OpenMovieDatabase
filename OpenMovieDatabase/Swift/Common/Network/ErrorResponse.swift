//
//  ErrorResponse.swift
//  OpenMovieDatabase
//
//  Created by Ilayda Kodal on 8/3/21.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case failure(NetworkError)
}

enum NetworkError: Error {
    case failedSession
    case invalidResponse
    case unknown
}
