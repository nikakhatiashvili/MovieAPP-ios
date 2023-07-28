//
//  MovieRepository.swift
//  Project2
//
//  Created by user on 7/28/23.
//

import Foundation

protocol MovieRepository {
    
    func getPopularMovies(completion: @escaping (Result<MovieResult>) -> Void)
}
