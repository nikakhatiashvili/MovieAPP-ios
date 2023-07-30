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
    
    public func getMovieDetails(id:Int, completion: @escaping (Result<DetailCast, Error>) -> Void){
        movieDetailRepository.getMovieDetails(id: id, completion: completion)
    }
}
