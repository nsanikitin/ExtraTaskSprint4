//
//  JokeFactoryDelegate.swift
//  ExtraTaskSprint4
//
//  Created by Сергей Никитин on 03.12.2023.
//

import Foundation

protocol JokeFactoryDelegate: AnyObject {
    func didReceiveNextJoke(joke: Joke?)
    func didLoadDataFromServer()
    func didFailToLoadData(with error: Error)
}
