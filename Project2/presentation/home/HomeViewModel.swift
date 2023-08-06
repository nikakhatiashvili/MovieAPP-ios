//
//  HomeViewModel.swift
//  Project2
//
//  Created by user on 7/25/23.
//

import Foundation
import Resolver

class HomeViewModel:ObservableObject {
    
    @Injected private var movieUseCase:MovieUseCase
    
    @Published var movies: [Movie] = []
    
    func getPopularMovies(completion: @escaping (Result<MovieResult, Error>) -> Void) {
        movieUseCase.getPopularMovies() { [self] result in
            switch result {
                
            case .success(let result):
                self.movies = result.results
                completion(.success(result))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func logout(completion: @escaping (Bool) -> Void){
        movieUseCase.logout(completion: completion)
    }
}
