//
//  SignInRepositoryImpl.swift
//  Project2
//
//  Created by user on 7/20/23.
//

import FirebaseAuth
import Foundation
import Resolver

class SignUpRepositoryImpl: SignUpRepository {
    
    @Injected private var authMediator:AuthenticationMediator
    
    
    func signUp(email: String, pass: String, completion: @escaping (Result<String,Error>) -> Void) {
        authMediator.signUp(email: email, pass: pass, completion: completion)
    }
}
