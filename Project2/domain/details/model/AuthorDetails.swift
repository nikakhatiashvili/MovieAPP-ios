//
//  AuthorDetails.swift
//  Project2
//
//  Created by user on 8/3/23.
//

import Foundation

struct AuthorDetails: Codable {
    let name, username: String?
    let avatarPath: String?
    let rating: Int?

    enum CodingKeys: String, CodingKey {
        case name, username
        case avatarPath = "avatar_path"
        case rating
    }
}
