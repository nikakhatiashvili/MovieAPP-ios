//
//  SignInRepositoryImpl.swift
//  Project2
//
//  Created by user on 7/20/23.
//

import FirebaseAuth
import Foundation

class SignUpRepositoryImpl: SignUpRepository {
    func signUp(email: String, pass: String, completion: @escaping (Result<String>) -> Void) {

        Auth.auth().createUser(withEmail: email, password: pass) { authResult, error in
            if let error = error {
                completion(.error(nil, error.localizedDescription))
            } else {
                let userID = authResult?.user.uid ?? ""
                completion(.success(userID))
            }
        }
    }
}
