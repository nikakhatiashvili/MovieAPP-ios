//
//  SignInRepositoryImpl.swift
//  Project2
//
//  Created by user on 7/20/23.
//

import Foundation
import FirebaseAuth

class SignInRepositoryImpl: SignInRepository{
    func signIn(email: String, pass: String, completion: @escaping (Result<String>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: pass)
        { authResult, error in
            if let error = error {
                completion(.error(nil, error.localizedDescription))
            } else {
                let userID = authResult?.user.email ?? ""
                completion(.success(userID))
            }
        }
    }

}
