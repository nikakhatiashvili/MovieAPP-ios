//
//  MovieDetailRepository.swift
//  Project2
//
//  Created by user on 7/29/23.
//

import Foundation

protocol MovieDetailRepository{
    
    func getMovieDetails(id:Int, completion: @escaping (Result<DetailCast, Error>) -> Void)
}
