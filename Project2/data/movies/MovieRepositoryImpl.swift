//
//  MovieRepositoryImpl.swift
//  Project2
//
//  Created by user on 7/28/23.
//

import Foundation
import Resolver
import Alamofire

class MovieRepositoryImpl: MovieRepository{
    
    @Injected private var movieMediator:MovieMediator
    
    func getPopularMovies(completion: @escaping (Result<MovieResult, Error>) -> Void) {
        let apiKey = "7f39984135c9621c058c979457e46b42"
        let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)"
        movieMediator.makeApiCall(MovieResult.self, url: urlString, completion: completion)
    }
}
