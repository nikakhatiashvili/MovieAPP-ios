//
//  SessionDeleteResponse.swift
//  Project2
//
//  Created by user on 8/6/23.
//

import Foundation

struct SessionDeleteResponse: Decodable {
    let success: Bool
    
    enum CodingKeys: String, CodingKey {
        case success
    }
}
