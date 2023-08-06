//
//  AuthRepository.swift
//  Project2
//
//  Created by user on 8/7/23.
//

import Foundation

protocol AuthRepository {
    
    func logout(completion: @escaping (Bool) -> Void)
}
