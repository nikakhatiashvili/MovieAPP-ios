//
//  MovieDetailViewModel.swift
//  Project2
//
//  Created by user on 7/29/23.
//

import Foundation
import Resolver

class MovieDetailViewModel{
    
    @Injected private var movieDetailUsecase: MovieDetailsUseCase
    
    
    
    func getMovieCast(id:Int, completion: @escaping (Result<DetailCast, Error>) -> Void){
        movieDetailUsecase.getMovieCast(id: id, completion: completion)
    }
    
    func getMovieDetails(id:Int, completion: @escaping (Result<DetailMovie, Error>) -> Void){
        movieDetailUsecase.getMovieDetails(id: id, completion: completion)
    }

}
