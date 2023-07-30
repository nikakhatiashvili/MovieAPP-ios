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
    
    func getDetails(id:Int, completion: @escaping (Result<DetailCast, Error>) -> Void){
        movieDetailUsecase.getMovieDetails(id: id, completion: completion)
    }
}
