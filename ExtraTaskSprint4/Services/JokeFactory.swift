//
//  JokeFactory.swift
//  ExtraTaskSprint4
//
//  Created by Сергей Никитин on 03.12.2023.
//

import Foundation

final class JokeFactory: JokeFactoryProtocol {
    weak var delegate: JokeFactoryDelegate?
    private let jokeLoader: JokeLoadingProtocol
    private var currentJoke: Joke = Joke(id: 265, type: "general", jokeText: "Why did the chicken get a penalty?", jokePunchline: "For fowl play")
    
    init(delegate: JokeFactoryDelegate?, jokeLoader: JokeLoadingProtocol) {
        self.delegate = delegate
        self.jokeLoader = jokeLoader
    }
    
    func requestNextJoke() {
        DispatchQueue.main.async { [weak self ] in
            guard let self = self else { return }
            self.delegate?.didReceiveNextJoke(joke: currentJoke)
        }
    }
    
    func loadData() {
        jokeLoader.loadJoke { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                switch result {
                case .success(let randomJoke):
                    self.currentJoke = randomJoke
                    self.delegate?.didLoadDataFromServer()
                case .failure(let error):
                    self.delegate?.didFailToLoadData(with: error)
                }
            }
        }
    }
    
}
