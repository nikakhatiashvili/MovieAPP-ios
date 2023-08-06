//
//  SessionResponse.swift
//  Project2
//
//  Created by user on 8/6/23.
//

import Foundation

struct SessionResponse: Decodable {
    let success: Bool
    let sessionId:String
    
    enum CodingKeys: String, CodingKey {
        case sessionId = "session_id"
        case success
    }
}
