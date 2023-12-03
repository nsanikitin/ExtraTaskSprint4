//
//  Joke.swift
//  ExtraTaskSprint4
//
//  Created by Сергей Никитин on 03.12.2023.
//

import Foundation

struct Joke: Codable {
    let id: Int
    let type: String
    let jokeText: String
    let jokePunchline: String
    
    private enum CodingKeys: String, CodingKey {
        case type = "type"
        case jokeText = "setup"
        case jokePunchline = "punchline"
        case id = "id"
    }
}
