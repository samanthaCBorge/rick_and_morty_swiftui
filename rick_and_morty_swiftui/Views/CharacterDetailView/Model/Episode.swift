//
//  Episode.swift
//  rick_and_morty_swiftui
//
//  Created by Samantha Cruz on 23/10/23.
//

import SwiftUI

struct Episode: Codable {
    let id: Int
    let name, airDate, episode: String
    let characters: [String]
    let url: String
    let created: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episode, characters, url, created
    }
}
