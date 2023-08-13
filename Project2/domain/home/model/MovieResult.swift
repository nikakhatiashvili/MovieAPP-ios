//
//  MovieResult.swift
//  Project2
//
//  Created by user on 7/26/23.
//

import Foundation

struct MovieResult: Codable {
    let page: Int
    let results: [Movie]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
