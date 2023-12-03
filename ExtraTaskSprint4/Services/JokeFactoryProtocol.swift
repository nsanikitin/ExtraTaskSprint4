//
//  JokeFactoryProtocol.swift
//  ExtraTaskSprint4
//
//  Created by Сергей Никитин on 03.12.2023.
//

import Foundation

protocol JokeFactoryProtocol {
    var delegate: JokeFactoryDelegate? { get set }
    func requestNextJoke()
    func loadData()
}
