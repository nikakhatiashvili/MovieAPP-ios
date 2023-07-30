//
//  MovieDetailRepositoryImpl.swift
//  Project2
//
//  Created by user on 7/29/23.
//

import Foundation
import Resolver

class MovieDetailRepositoryImpl: MovieDetailRepository {
    
    @Injected private var movieMediator:MovieMediator
    
    func getMovieDetails(id: Int, completion: @escaping (Result<DetailCast, Error>) -> Void) {
        let apiKey = "movie/\(id)/credits?api_key=7f39984135c9621c058c979457e46b42"
        let urlString = "https://api.themoviedb.org/3/\(apiKey)"
        print(urlString)
        movieMediator.getMovieDetails(url: urlString, completion:completion)
    }
    
}
