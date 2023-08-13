//
//  SignInRepositoryImpl.swift
//  Project2
//
//  Created by user on 7/20/23.
//

import Foundation
import Resolver

class SignInRepositoryImpl: SignInRepository {

    @Injected private var authMediator: AuthenticationMediator

    func signIn(email: String, pass: String, completion: @escaping (Result<String, Error>) -> Void) {
        authMediator.getToken { result in
            switch result {
            case .success(let authTokenResponse):
                self.authMediator.validateTokenWithLogin(email: email, pass: pass, requestToken: authTokenResponse.requestToken) { result in
                    switch result {
                    case .success(let loginResponse):
                        self.authMediator.createSession(requestToken: loginResponse.requestToken) { result in
                            switch result {
                            case .success(let sessionResponse):
                                self.saveSessionId(sessionId: sessionResponse.sessionId)
                                completion(.success(sessionResponse.sessionId))
                            case .failure(let error):
                                completion(.failure(error))
                            }
                        }
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private func saveSessionId(sessionId: String) {
        UserDefaults.standard.set(sessionId, forKey: "sessionId")
        UserDefaults.standard.synchronize()
    }
    
}
