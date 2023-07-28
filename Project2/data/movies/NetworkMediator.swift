//
//  NetworkMediator.swift
//  Project2
//
//  Created by user on 7/28/23.
//

import Foundation
import Alamofire

class NetworkMediator : MovieMediator {
    
    func getPopularMovies(url: String, completion: @escaping (Result<MovieResult>) -> Void) {
        DispatchQueue.global(qos: .background).async {
             AF.request(url).responseJSON { response in
                 switch response.result {
                 case .success(let value):
                     do {
                         let jsonData = try JSONSerialization.data(withJSONObject: value)
                         let decoder = JSONDecoder()
                         let result = try decoder.decode(MovieResult.self, from: jsonData)
                         DispatchQueue.main.async {
                             completion(.success(result))
                         }
                     } catch {
                         DispatchQueue.main.async {
                             completion(.error(0,error))
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
