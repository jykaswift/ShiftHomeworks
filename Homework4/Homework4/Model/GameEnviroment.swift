//
//  GameEnviromental.swift
//  Homework4
//
//  Created by Евгений Борисов on 07.05.2024.
//

import Foundation
import UIKit

enum GameAvailibility: String {
    case perfect = "Perfrect"
    case playable = "Playable"
    case unplayble = "Unplayable"

    var color: UIColor {
        switch(self) {
        case .perfect:
            UIColor.green
        case .playable:
            UIColor.orange
        case .unplayble:
            UIColor.red
        }
    }
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
