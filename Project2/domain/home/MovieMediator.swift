//
//  MovieMediator.swift
//  Project2
//
//  Created by user on 7/28/23.
//

import Foundation

protocol MovieMediator {
    
    func getPopularMovies(url:String,completion: @escaping (Result<MovieResult>) -> Void)
}
