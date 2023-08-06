//
//  AuthRepositoryImpl.swift
//  Project2
//
//  Created by user on 8/7/23.
//

import Foundation
import Resolver

class AuthRepositoryImpl: AuthRepository {
    
    @Injected private var authMediator: AuthenticationMediator
    
    func logout(completion: @escaping (Bool) -> Void) {
        authMediator.deletSession{ result in
            switch result {
            case.success(_):
                completion(true)
            case.failure(_):
                completion(false)
            }
        }
    }
}
