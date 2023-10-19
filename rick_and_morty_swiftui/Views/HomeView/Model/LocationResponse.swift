//
//  LocationResponse.swift
//  rick_and_morty_swiftui
//
//  Created by Samantha Cruz on 3/10/23.
//

import Foundation

struct LocationResponse: Codable {
    let info: Info
    let results: [Location]
}

struct Info: Codable {
    let count: Int
}
