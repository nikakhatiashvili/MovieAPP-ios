//
//  FirebaseAuthMediator.swift
//  Project2
//
//  Created by user on 7/25/23.
//

import Foundation
import Alamofire
import Resolver

class NetworkAuthMediator: AuthenticationMediator {
    
    @Injected private var apiService: APIService


    func getToken(completion: @escaping (Result<AuthTokenResponse, Error>) -> Void) {
        apiService.getToken(completion: completion)
    }

    func validateTokenWithLogin(email: String, pass: String, requestToken: String, completion: @escaping (Result<LoginResponse, Error>) -> Void) {
        apiService.validateTokenWithLogin(email: email, pass: pass, requestToken: requestToken, completion: completion)
    }

    func createSession(requestToken: String, completion: @escaping (Result<SessionResponse, Error>) -> Void) {
        apiService.createSession(requestToken: requestToken, completion: completion)
    }
}
