//
//  FirebaseAuthMediator.swift
//  Project2
//
//  Created by user on 7/25/23.
//

import Foundation
import FirebaseAuth
import Alamofire

class FirebaseAuthMediator: AuthenticationMediator {
    
    func signIn(email: String, pass: String, completion: @escaping (Bool) -> Void) {
        print(email)
        print(pass)
        let apiKey = "7f39984135c9621c058c979457e46b42"
        let tokenUrl = "https://api.themoviedb.org/3/authentication/token/new?api_key=\(apiKey)"
        
        AF.request(tokenUrl).responseData { response in
            switch response.result {
            case.success(let data):
                guard 200..<300 ~= response.response!.statusCode else {
                    print("Error fetching authentication token: \(response.response?.statusCode ?? -1)")
                    completion(false)
                    return
                }
                guard let response = try? JSONDecoder().decode(AuthTokenResponse.self, from: data) else {
                    print("Error decoding token response")
                    completion(false)
                    return
                }
                
                let validateUrl = "https://api.themoviedb.org/3/authentication/token/validate_with_login?api_key=\(apiKey)"
                let params: Parameters = ["username": email, "password": pass, "request_token": response.requestToken]
                print(response.requestToken)
                AF.request(validateUrl, method: .post, parameters: params).responseData { response in
                    switch response.result {
                    case .success(let data):
                        guard 200..<300 ~= response.response!.statusCode else {
                            print("Error validating token with login: \(response.response?.statusCode ?? -1)")
                            completion(false)
                            return
                        }
                        guard let res = try? JSONDecoder().decode(LoginResponse.self, from: data) else {
                            print("Error decoding login response")
                            completion(false)
                            return
                        }
                        print(res.requestToken)
                        let createSession = "https://api.themoviedb.org/3/authentication/session/new?api_key=\(apiKey)"
                        let sessionParams: Parameters = ["request_token": res.requestToken]
                        AF.request(createSession, method: .post, parameters: sessionParams).responseData{  response in
                            switch response.result {
                            case.success(let data):
                                guard 200..<300 ~= response.response!.statusCode else {
                                    print("Error creating session with login: \(response.response?.statusCode ?? -1)")
                                    completion(false)
                                    return
                                }
                                guard let response = try? JSONDecoder().decode(SessionResponse.self, from: data) else {
                                    print("Error decoding login response")
                                    completion(false)
                                    return
                                }
                                print(response.sessionId)
                                completion(response.success)
                            case .failure(let error):
                                print("Error validating token with login: \(error)")
                                completion(false)
                        }
                    }
                case .failure(let error):
                    print("Error validating token with login: \(error)")
                    completion(false)
                }
            }
            case .failure(let error):
                print("Error fetching authentication token: \(error)")
                completion(false)
            }
            
        }
        
    }
    
    func signUp(email: String, pass: String, completion: @escaping (Result<String, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: pass){
            authResult, error in
            if let error = error {
                completion(.failure(error))
            }else{
                let userID = authResult?.user.uid ?? ""
                completion(.success(userID))
            }
        }
    }
}
