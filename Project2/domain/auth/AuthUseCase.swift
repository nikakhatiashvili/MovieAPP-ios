//
//  AuthUseCase.swift
//  Project2
//
//  Created by user on 8/6/23.
//

import Foundation
import Resolver

class AuthUseCase{
    
    @Injected private var authRepository:AuthRepository

    public func logout(completion: @escaping (Bool) -> Void){
        authRepository.logout(completion: completion)
    }
}
