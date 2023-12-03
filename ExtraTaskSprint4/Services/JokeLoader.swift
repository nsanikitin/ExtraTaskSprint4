//
//  JokeLoader.swift
//  ExtraTaskSprint4
//
//  Created by Сергей Никитин on 03.12.2023.
//

import Foundation

struct JokeLoader: JokeLoadingProtocol {
    // MARK: - NetworkClient
    private let networkClient = NetworkClient()
    
    // MARK: - URL
    private var randomJokeUrl: URL {
        guard let url = URL(string: "https://official-joke-api.appspot.com/jokes/random") else {
            preconditionFailure("Unable to construct random joke")
        }
        return url
    }
    
    // метод загрузки шутки
    func loadJoke(handler: @escaping (Result<Joke, Error>) -> Void) {
        networkClient.fetch(url: randomJokeUrl) { result in
            switch result {
            case .success(let data):
                do {
                    let randomJoke = try JSONDecoder().decode(Joke.self, from: data)
                    handler(.success(randomJoke))
                } catch {
                    handler(.failure(error))
                }
            case .failure(let error):
                handler(.failure(error))
            }
        }
    }
    
}
