//
//  GameEnviromentViewModel.swift
//  Homework4
//
//  Created by Евгений Борисов on 17.05.2024.
//

import Foundation


class GameEnviromentViewModel {
    var gameAvailibility: Observable<GameAvailibility>
    let enviromentName: String

    init(enviromentName: String, gameAvailibility: GameAvailibility) {
        self.gameAvailibility = Observable(value: gameAvailibility)
        self.enviromentName = enviromentName
    }

    func changeAvailibity() {
        let workItem = DispatchWorkItem { [weak self] in
            guard let self else { return }
            self.gameAvailibility.value = .unplayble
        }

        let randomTime = DispatchTimeInterval.seconds(Int.random(in: 5...10))

        DispatchQueue.main.asyncAfter(deadline: .now() + randomTime, execute: workItem)
    }
}
