//
//  GameEnviromentAssembly.swift
//  Homework4
//
//  Created by Евгений Борисов on 20.05.2024.
//

import UIKit

enum GameEnviromentAssembly {
    struct Parametres {
        let gameEnviroment: GameEnviroment
    }

    static func makeModule(parametres: Parametres) -> UIViewController {
        let enviromentName = parametres.gameEnviroment.name.rawValue
        let gameAvailibility = parametres.gameEnviroment.availibility
        let viewModel = GameEnviromentViewModel(enviromentName: enviromentName, gameAvailibility: gameAvailibility)
        let viewController = GameEnviromentViewController(viewModel: viewModel)

        return viewController
    }
}
