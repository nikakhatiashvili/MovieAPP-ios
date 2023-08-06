//
//  MovieRepositoryImpl.swift
//  Project2
//
//  Created by user on 7/28/23.
//

import Foundation
import Resolver
import Alamofire

class MovieRepositoryImpl: MovieRepository{
    
    @Injected private var movieMediator:MovieMediator
    
    func getPopularMovies(completion: @escaping (Result<MovieResult, Error>) -> Void) {
        let apiKey = "7f39984135c9621c058c979457e46b42"
        let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)"
        movieMediator.makeApiCall(MovieResult.self, url: urlString, completion: completion)
    }
    
    func logout(completion: @escaping (Bool) -> Void) {
        let apiKey = "7f39984135c9621c058c979457e46b42"
        let urlString = "https://api.themoviedb.org/3/authentication/session?api_key=\(apiKey)"
        let sessionId = UserDefaults.standard.string(forKey: "sessionId") ?? ""
        print(sessionId)
        let params: Parameters = ["session_id": sessionId]
        AF.request(urlString, method: .delete, parameters: params).responseData { response in
            switch response.result {
            case.success(let data):
                guard 200..<300 ~= response.response!.statusCode else {
                    print("Error Logging out: \(response.response?.statusCode ?? -1)")
                    completion(false)
                    return
                }
                completion(true)
                print(data)
            case.failure(let error):
                completion(false)
                print(error)
            }
        }
    }
}
