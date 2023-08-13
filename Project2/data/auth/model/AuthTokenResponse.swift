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
