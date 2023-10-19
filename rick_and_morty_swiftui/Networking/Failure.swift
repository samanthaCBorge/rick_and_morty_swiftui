//
//  Failure.swift
//  rick_and_morty_swiftui
//
//  Created by Samantha Cruz on 3/10/23.
//

import Foundation

enum Failure: Error {
    case decodingError
    case urlConstructError
    case APIError(Error)
    case statusCode
}
