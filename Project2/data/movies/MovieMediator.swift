//
//  MovieMediator.swift
//  Project2
//
//  Created by user on 7/28/23.
//

import Foundation

protocol MovieMediator {
    
    func makeApiCall<T: Decodable>(_ type: T.Type, url: String, completion: @escaping (Result<T, Error>) -> Void)
}
