//
//  Cast.swift
//  Project2
//
//  Created by user on 7/29/23.
//

import Foundation

struct Cast: Codable {
    let adult: Bool
    let gender, id: Int
    let name, originalName: String
    let popularity: Double
    let profilePath: String?
    let castID: Int?
    let character: String?
    let creditID: String

    enum CodingKeys: String, CodingKey {
        case adult, gender, id
        case name
        case originalName = "original_name"
        case popularity
        case profilePath = "profile_path"
        case castID = "cast_id"
        case character
        case creditID = "credit_id"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        adult = try container.decode(Bool.self, forKey: .adult)
        gender = try container.decode(Int.self, forKey: .gender)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        originalName = try container.decode(String.self, forKey: .originalName)
        popularity = try container.decode(Double.self, forKey: .popularity)
        profilePath = try container.decodeIfPresent(String.self, forKey: .profilePath)
        castID = try container.decodeIfPresent(Int.self, forKey: .castID)
        character = try container.decodeIfPresent(String.self, forKey: .character)
        creditID = try container.decode(String.self, forKey: .creditID)
        
    }
}
