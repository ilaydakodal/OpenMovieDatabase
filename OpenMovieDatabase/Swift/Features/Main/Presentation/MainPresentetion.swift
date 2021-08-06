//
//  MainPresentetion.swift
//  OpenMovieDatabase
//
//  Created by Ilayda Kodal on 8/3/21.
//

import Foundation

struct MoviePresentetion {
    let nameLabelText: String
    let dateLabelText: String
    let posterImage: String
    let detailText: String
}

struct MainPresentation {
    let detailPresentation: MoviePresentetion
    let listPresentation: [MoviePresentetion]
}
