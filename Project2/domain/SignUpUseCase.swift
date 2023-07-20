//
//  SignUpUseCase.swift
//  Project2
//
//  Created by user on 7/20/23.
//

import Foundation
import Resolver

class SignUpUseCase {
    
    private let signInRepository: SignUpRepository

    init(signInRepository: SignUpRepository = Resolver.resolve()) {
        self.signInRepository = signInRepository
    }

    public func signUp(email:String,password:String){
        signInRepository.signUp(email: email, pass: password)
    }
}
