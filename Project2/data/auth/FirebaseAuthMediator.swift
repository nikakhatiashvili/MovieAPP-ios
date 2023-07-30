//
//  FirebaseAuthMediator.swift
//  Project2
//
//  Created by user on 7/25/23.
//

import Foundation
import FirebaseAuth

class FirebaseAuthMediator: AuthenticationMediator {
    
    func signIn(email: String, pass: String, completion: @escaping (Result<String, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: pass)
        { authResult, error in
            if let error = error {
                completion(.failure(error))
            } else {
                let userID = authResult?.user.email ?? ""
                completion(.success(userID))
            }
        }
    }
    
    func signUp(email: String, pass: String, completion: @escaping (Result<String, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: pass){
            authResult, error in
            if let error = error {
                completion(.failure(error))
            }else{
                let userID = authResult?.user.email ?? ""
                completion(.success(userID))
            }
        }
    }
}
