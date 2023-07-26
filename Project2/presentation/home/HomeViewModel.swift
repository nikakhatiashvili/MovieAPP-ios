//
//  HomeViewModel.swift
//  Project2
//
//  Created by user on 7/25/23.
//

import Foundation
import Alamofire

class HomeViewModel:ObservableObject {
    
    func getPopularMovies(completion: @escaping ([String: Any]?, Error?) -> Void) {
        let apiKey = "7f39984135c9621c058c979457e46b42"
        let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)"
        
        AF.request(urlString).responseJSON { response in
            switch response.result {
            case .success(let value):
                if let json = value as? [String: Any] {
                    print(json)
                    completion(json, nil)
                } else {
                    completion(nil, NSError(domain: "Parsing Error", code: 0, userInfo: nil))
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
        
    }
}
