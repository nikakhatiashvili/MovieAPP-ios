//
//  HomeViewModel.swift
//  Project2
//
//  Created by user on 7/25/23.
//

import Foundation
import Alamofire

class HomeViewModel:ObservableObject {
    
    @Published var movies: [Movie] = []
    
    func getPopularMovies(completion: @escaping (Result<MovieResult>) -> Void) {
        let apiKey = "7f39984135c9621c058c979457e46b42"
        let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)"
        DispatchQueue.global(qos: .background).async {
             AF.request(urlString).responseJSON { response in
                 switch response.result {
                 case .success(let value):
                     do {
                         let jsonData = try JSONSerialization.data(withJSONObject: value)
                         let decoder = JSONDecoder()
                         let result = try decoder.decode(MovieResult.self, from: jsonData)
                         self.movies = result.results
                         DispatchQueue.main.async {
                             completion(.success(result))
                         }
                     } catch {
                         DispatchQueue.main.async {
                             completion(.error(0,error.localizedDescription))
                         }
                     }
                 case .failure(let error):
                     DispatchQueue.main.async {
                         completion(.exception(error))
                     }
                 }
             }
         }
     }
}
