//
//  GameInfoAssembly.swift
//  Homework4
//
//  Created by Евгений Борисов on 18.05.2024.
//

import Foundation

import UIKit

enum GameInfoAssembly {

    struct Parametres {
        let game: Game
    }

    static func makeModule(with parametes: Parametres) -> UIViewController {
        let router = GameInfoRouter()
        let presenter = GameInfoPresenter(game: parametes.game, router: router)
        let viewController = GameInfoViewController(presenter: presenter)
        router.setupParentViewController(viewController)
        return viewController
    }
}
