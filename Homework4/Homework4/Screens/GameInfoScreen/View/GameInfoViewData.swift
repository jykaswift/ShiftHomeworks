//
//  GameInfoViewData.swift
//  Homework4
//
//  Created by Евгений Борисов on 20.05.2024.
//

struct GameInfoViewData {
    let gameName: String
}

extension GameInfoViewData {
    init(with game: Game) {
        self.gameName = game.name
    }
}
