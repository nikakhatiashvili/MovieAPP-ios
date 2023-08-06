//
//  AuthenticationMediator.swift
//  Project2
//
//  Created by user on 7/25/23.
//

import Foundation

protocol AuthenticationMediator {

    func getToken(completion: @escaping (Result<AuthTokenResponse, Error>) -> Void)
    
    func validateTokenWithLogin(email: String, pass: String, requestToken: String, completion: @escaping (Result<LoginResponse, Error>) -> Void)
    
    func createSession(requestToken: String, completion: @escaping (Result<SessionResponse, Error>) -> Void)
}
