//
//  LoginResponse.swift
//  Project2
//
//  Created by user on 8/6/23.
//

import Foundation

struct LoginResponse: Decodable {
    let success: Bool
    let expiresAt:String
    let requestToken:String
    
    enum CodingKeys: String, CodingKey {
        case expiresAt = "expires_at"
        case requestToken = "request_token"
        case success
    }
}
