//
//  Location.swift
//  rick_and_morty_swiftui
//
//  Created by Samantha Cruz on 3/10/23.
//

import Foundation

struct Location: Codable {
    let id: Int?
    let name: String?
    let residents: [String]?
    let url: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case url
        case residents
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        residents = try values.decodeIfPresent([String].self, forKey: .residents)
    }
}
