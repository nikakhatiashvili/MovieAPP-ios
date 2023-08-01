//
//  MovieDetailsUseCase.swift
//  Project2
//
//  Created by user on 7/29/23.
//

import Foundation
import Resolver

class MovieDetailsUseCase{
    
    @Injected private var movieDetailRepository: MovieDetailRepository
    
    public func getMovieCast(id:Int, completion: @escaping (Result<DetailCast, Error>) -> Void){
        print(id)
        movieDetailRepository.getMovieCast(id: id, completion: completion)
    }
    
    public func getMovieDetails(id:Int, completion: @escaping (Result<DetailMovie, Error>) -> Void){
        print(id)
        movieDetailRepository.getMovieDetails(id: id, completion: completion)
    }
}
