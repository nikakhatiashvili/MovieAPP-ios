//
//  APIURLBuilder.swift
//  Project2
//
//  Created by user on 8/6/23.
//

import Foundation

class APIURLBuilder {
    private let apiKey: String = "7f39984135c9621c058c979457e46b42"
    
    func tokenEndpoint() -> String {
        return "https://api.themoviedb.org/3/authentication/token/new?api_key=\(apiKey)"
    }
    
    func validateTokenEndpoint() -> String {
        return "https://api.themoviedb.org/3/authentication/token/validate_with_login?api_key=\(apiKey)"
    }
    
    func createSessionEndpoint() -> String {
        return "https://api.themoviedb.org/3/authentication/session/new?api_key=\(apiKey)"
    }
}
