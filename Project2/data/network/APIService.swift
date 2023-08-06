//
//  APIService.swift
//  Project2
//
//  Created by user on 8/6/23.
//

import Foundation
import Alamofire
import Resolver

class APIService {
    
    @Injected private var urlBuilder: APIURLBuilder

    func getToken(completion: @escaping (Result<AuthTokenResponse, Error>) -> Void) {
        let tokenUrl = urlBuilder.tokenEndpoint()
        self.requestData(url: tokenUrl, method: .get, parameters: nil, completion: completion)
    }
    
    func validateTokenWithLogin(email: String, pass: String, requestToken: String, completion: @escaping (Result<LoginResponse, Error>) -> Void) {
        let validateUrl = urlBuilder.validateTokenEndpoint()
        let params: Parameters = ["username": email, "password": pass, "request_token": requestToken]
        self.requestData(url: validateUrl, method: .post, parameters: params, completion: completion)
    }
    
    func createSession(requestToken: String, completion: @escaping (Result<SessionResponse, Error>) -> Void) {
        let createSessionUrl = urlBuilder.createSessionEndpoint()
        let sessionParams: Parameters = ["request_token": requestToken]
        self.requestData(url: createSessionUrl, method: .post, parameters: sessionParams, completion: completion)
    }
    
    func requestData<T: Decodable>(url: String, method: HTTPMethod, parameters: Parameters?, completion: @escaping (Result<T, Error>) -> Void) {
        AF.request(url, method: method, parameters: parameters).responseData { response in
            switch response.result {
            case .success(let data):
                guard 200..<300 ~= response.response!.statusCode else {
                    completion(.failure(response.error ?? AFError.responseValidationFailed(reason: .dataFileNil)))
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    let object = try decoder.decode(T.self, from: data)
                    completion(.success(object))
                } catch {
                    completion(.failure(AFError.responseSerializationFailed(reason: .decodingFailed(error: error))))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
