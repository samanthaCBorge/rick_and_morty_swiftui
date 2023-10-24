//
//  CharacterResponse.swift
//  rick_and_morty_swiftui
//
//  Created by Samantha Cruz on 17/10/23.
//

import SwiftUI

struct CharacterInfo: Codable {
    let id: Int
    let name, status, species, type: String
    let gender: String
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String

    var statusMember: Color {
        switch status {
        case "Alive":
            return .green
        case "Dead":
            return .red
        case "unknown":
            return .gray
        default:
            return .gray
        }
    }
}

