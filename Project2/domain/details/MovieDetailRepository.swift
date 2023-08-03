//
//  MovieDetailRepository.swift
//  Project2
//
//  Created by user on 7/29/23.
//

import Foundation

protocol MovieDetailRepository{
    
    func getMovieCast(id:Int, completion: @escaping (Result<DetailCast, Error>) -> Void)
    
    func getMovieDetails(id:Int, completion: @escaping (Result<DetailMovie, Error>) -> Void)
    
    func getMovieReviews(id:Int, completion: @escaping (Result<ReviewResult, Error>) -> Void)
}
