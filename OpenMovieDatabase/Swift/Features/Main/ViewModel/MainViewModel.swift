//
//  MainViewModel.swift
//  OpenMovieDatabase
//
//  Created by Ilayda Kodal on 8/3/21.
//

import Foundation

class MainViewModel {
    
    enum Change {
        case presentation(presentation: MainPresentation)
        case alert(message: String)
    }
    
    var changeHandler: ((Change) -> Void)?
    
    func fetchMovie(movie: String) {
        NetworkManager.shared.getData(url: URL.urlForMovieApi(movie: movie)) { (result: NetworkResult<MovieResponse>) in
            switch result {
            case .success(let response):
                self.handleResponse(response)
                print(response)
            case .failure(let error):
                self.changeHandler?(.alert(message: "Something Went Wrong \n Error: \(error)"))
            }
        }
    }
    
    func handleResponse(_ response: MovieResponse) {
        let detaiPresentation = MoviePresentetion(nameLabelText: response.title, dateLabelText: response.released, posterImage: response.poster, detailText: response.plot )
        
        var listPresentation: [MoviePresentetion] = []
        listPresentation.append(MoviePresentetion(nameLabelText: response.title, dateLabelText: response.released, posterImage: response.poster, detailText: response.plot))
        
        let mainPresentation = MainPresentation(detailPresentation: detaiPresentation, listPresentation: listPresentation)
        
        changeHandler?(.presentation(presentation: mainPresentation))
    }
}
