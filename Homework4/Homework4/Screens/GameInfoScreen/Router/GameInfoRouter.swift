//
//  GameInfoRouter.swift
//  Homework4
//
//  Created by Евгений Борисов on 20.05.2024.
//

import Foundation
import UIKit

class GameInfoRouter {

    private var parentViewController: UIViewController?

    func showGameEnviromentScreen(with gameEnviroment: GameEnviroment) {
        let parameters = GameEnviromentAssembly.Parametres(gameEnviroment: gameEnviroment)
        let viewController = GameEnviromentAssembly.makeModule(parametres: parameters)
        parentViewController?.present(viewController, animated: true)
    }

    func setupParentViewController(_ viewController: UIViewController) {
        parentViewController = viewController
    }
}

