//
//  Result.swift
//  Project2
//
//  Created by user on 7/20/23.
//

import Foundation

enum Result<T> {
    case success(T)
    case error(Int?, String?)
    case exception(Error)
}
