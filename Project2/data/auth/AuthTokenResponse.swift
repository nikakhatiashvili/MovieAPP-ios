//
//  AuthTokenResponse.swift
//  Project2
//
//  Created by user on 8/6/23.
//

import Foundation

struct AuthTokenResponse: Decodable {
    let requestToken: String
    
    enum CodingKeys: String, CodingKey {
        case requestToken = "request_token"
    }
}

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

struct SessionResponse: Decodable {
    let success: Bool
    let sessionId:String
    
    enum CodingKeys: String, CodingKey {
        case sessionId = "session_id"
        case success
    }
}
