//
//  SignUpUseCase.swift
//  Project2
//
//  Created by user on 7/20/23.
//

import Foundation
import Resolver

class SignUpUseCase {
    
    @Injected private var signUpRepository: SignUpRepository

    init(signUpRepository: SignUpRepository = Resolver.resolve()) {
        self.signUpRepository = signUpRepository
    }

    public func signUp(email: String, password: String, completion: @escaping (Result<String>) -> Void) {
        signUpRepository.signUp(email: email, pass: password) { result in
            completion(result)
        }
    }
}
