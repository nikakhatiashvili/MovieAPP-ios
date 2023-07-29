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
    
    func getPopularMovies(completion: @escaping (Result<MovieResult>) -> Void) {
        let apiKey = "7f39984135c9621c058c979457e46b42"
        let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)"
        
        movieUseCase.getPopularMovies(){ [self] result in
            switch result {
                
            case .success(let result):
                self.movies = result.results
                completion(.success(result))
                
            case .error(_, let message):
                completion(.error(0, message))
    
            case .exception(_): break
            }
        }
    }
}
