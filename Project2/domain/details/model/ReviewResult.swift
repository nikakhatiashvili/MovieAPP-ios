//
//  ReviewResult.swift
//  Project2
//
//  Created by user on 8/3/23.
//

import Foundation

struct ReviewResult : Codable {
    let id, page: Int
    let results: [Review]?
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case id, page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
