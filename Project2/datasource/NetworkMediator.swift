//
//  NetworkMediator.swift
//  Project2
//
//  Created by user on 7/28/23.
//

import Foundation
import Alamofire

class NetworkMediator : MovieMediator {

    func makeApiCall<T: Decodable>(_ type: T.Type, url: String, completion: @escaping (Result<T, Error>) -> Void) {
        DispatchQueue.global(qos: .background).async {
            AF.request(url).responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let result):
                    DispatchQueue.main.async {
                        completion(.success(result))
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                }
            }
        }
    }
}
