//
//  ApiService.swift
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
    
    func deleteSession(completion: @escaping (Result<SessionDeleteResponse, Error>) -> Void) {
        let validateUrl = urlBuilder.deleteSessionEndpoint()
        let sessionId = UserDefaults.standard.string(forKey: "sessionId") ?? ""
        let params: Parameters = ["session_id": sessionId]
        self.requestData(url: validateUrl, method: .delete, parameters: params, completion: completion)
    }
    
    func createSession(requestToken: String, completion: @escaping (Result<SessionResponse, Error>) -> Void) {
        let createSessionUrl = urlBuilder.createSessionEndpoint()
        let sessionParams: Parameters = ["request_token": requestToken]
        self.requestData(url: createSessionUrl, method: .post, parameters: sessionParams, completion: completion)
    }
    
    func requestData<T: Decodable>(url: String, method: HTTPMethod, parameters: Parameters?, completion: @escaping (Result<T, Error>) -> Void) {
        AF.request(url, method: method, parameters: parameters).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let object):
                completion(.success(object))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
