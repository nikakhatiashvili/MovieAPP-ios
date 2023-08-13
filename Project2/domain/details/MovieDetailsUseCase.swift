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
        movieDetailRepository.getMovieCast(id: id, completion: completion)
    }
    
    public func getMovieDetails(id:Int, completion: @escaping (Result<DetailMovie, Error>) -> Void){
        movieDetailRepository.getMovieDetails(id: id, completion: completion)
    }
    public func getMovieReviews(id:Int, completion: @escaping (Result<ReviewResult, Error>) -> Void){
        movieDetailRepository.getMovieReviews(id: id, completion: completion)
    }
}
