//
//  AuthenticationMediator.swift
//  Project2
//
//  Created by user on 7/25/23.
//

import Foundation

protocol AuthenticationMediator {
    func signIn(email: String, pass: String, completion: @escaping (Result<String, Error>) -> Void)
    
    func signUp(email:String, pass:String, completion: @escaping (Result<String, Error>) -> Void)
    
}
