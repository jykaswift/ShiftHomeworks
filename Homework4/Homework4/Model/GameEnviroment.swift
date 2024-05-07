//
//  GameEnviromental.swift
//  Homework4
//
//  Created by Евгений Борисов on 07.05.2024.
//

import Foundation

enum GameAvailibility {
    case perfect
    case playable
    case unplayble
    case none
}

enum GameEnviromentName: String {
    case rosseta2 = "Rosseta 2"
    case crossover = "Crossover"
    case wine = "Wine"
}

struct GameEnviroment {
    let name: GameEnviromentName
    let availibility: GameAvailibility
}
