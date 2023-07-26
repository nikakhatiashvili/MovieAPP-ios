//
//  SignInUseCase.swift
//  Project2
//
//  Created by user on 7/20/23.
//

import Foundation
import Resolver
class SignInUseCase{
    
    @Injected private var signInRepository: SignInRepository

    init(signInRepository: SignInRepository = Resolver.resolve()) {
        self.signInRepository = signInRepository
    }

    public func signIn(email: String, password: String, completion: @escaping (Result<String>) -> Void) {
        signInRepository.signIn(email: email, pass: password) { result in
            completion(result)
        }
    }
}
