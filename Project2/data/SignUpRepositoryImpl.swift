//
//  SignInRepositoryImpl.swift
//  Project2
//
//  Created by user on 7/20/23.
//

import FirebaseAuth
import Foundation

class SignUpRepositoryImpl:SignUpRepository{
    func signUp(email: String, pass: String) {

        Auth.auth().createUser(withEmail: email, password: pass) { authResult, error in
            if let error = error {
                print("Sign-up error: \(error.localizedDescription)")
            } else {
                print("Sign-up successful. User ID: \(authResult?.user.uid ?? "")")
            }
        }
    }
}
