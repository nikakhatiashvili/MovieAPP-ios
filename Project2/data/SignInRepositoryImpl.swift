//
//  SignInRepositoryImpl.swift
//  Project2
//
//  Created by user on 7/20/23.
//

import Foundation
import Resolver

class SignInRepositoryImpl: SignInRepository{
    
    @Injected private var authMediator:AuthenticationMediator
    
    func signIn(email: String, pass: String, completion: @escaping (Result<String>) -> Void) {
        authMediator.signIn(email: email, pass: pass, completion: completion)
    }

}
