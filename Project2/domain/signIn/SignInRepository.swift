//
//  SignInRepository.swift
//  Project2
//
//  Created by user on 7/20/23.
//

import Foundation
protocol SignInRepository {
    
    func signIn(email: String, pass: String, completion: @escaping (Bool) -> Void)
}
