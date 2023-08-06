//
//  MovieUseCase.swift
//  Project2
//
//  Created by user on 7/29/23.
//

import Foundation
import Resolver

class MovieUseCase {
    
    @Injected private var movieRepository:MovieRepository
    
    public func getPopularMovies(completion: @escaping (Result<MovieResult, Error>) -> Void){
        movieRepository.getPopularMovies(){
            result in completion(result)
        }
    }
}
