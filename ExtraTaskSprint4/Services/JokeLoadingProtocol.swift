//
//  JokeLoaderProtocol.swift
//  ExtraTaskSprint4
//
//  Created by Сергей Никитин on 03.12.2023.
//

import Foundation

protocol JokeLoadingProtocol {
    func loadJoke(handler: @escaping (Result<Joke, Error>) -> Void)
}
