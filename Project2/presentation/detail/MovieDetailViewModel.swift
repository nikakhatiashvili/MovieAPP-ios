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
    
    func getMovieReviews(id:Int, completion: @escaping (Result<ReviewResult, Error>) -> Void){
        movieDetailUsecase.getMovieReviews(id: id, completion: completion)
    }
    
    
    
    func formatTime(minutes: Int) -> String {
        let hours = minutes / 60
        let remainingMinutes = minutes % 60
        
        if hours == 0 {
            return "\(remainingMinutes)m"
        } else if remainingMinutes == 0 {
            return "\(hours)h"
        } else {
            return "\(hours)h, \(remainingMinutes)m"
        }
    }
    
    func concatenateGenres(_ genres: [Genre]) -> String {
        let genreNames = genres.map { $0.name }
        return genreNames.joined(separator: " | ")
    }
}
