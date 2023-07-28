//
//  MovieRepositoryImpl.swift
//  Project2
//
//  Created by user on 7/28/23.
//

import Foundation
import Resolver

class MovieRepositoryImpl: MovieRepository{
    
    @Injected private var movieMediator:MovieMediator
    
    func getPopularMovies(completion: @escaping (Result<MovieResult>) -> Void) {
        let apiKey = "7f39984135c9621c058c979457e46b42"
        let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)"
        movieMediator.getPopularMovies(url: urlString, completion:completion)
    }
}
