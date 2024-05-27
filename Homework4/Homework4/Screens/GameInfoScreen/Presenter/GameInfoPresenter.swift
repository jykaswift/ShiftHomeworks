//
//  GameInfoPresenter.swift
//  Homework4
//
//  Created by Евгений Борисов on 16.05.2024.
//

import Foundation

protocol GameInfoPresenterProtocol: AnyObject {
    func getGame() -> Game
    func getGameDescription() -> String
    func getGameInfoSection(with index: Int) -> GameInfoSection
    func getGameEnviroment(with index: Int) -> GameEnviroment
    func didLoad(ui: GameInfoViewProtocol)
    func didClickCollectionAt(indexPath: IndexPath)

    func numberOfRows(in section: Int) -> Int
    func numberOfSections() -> Int
    func headerTitleFor(section: Int) -> String
}

class GameInfoPresenter {
    private let game: Game
    private let gameInfoSections = GameInfoSection.allCases
    private let router: GameInfoRouter
    weak var ui: GameInfoViewProtocol?

    init(game: Game, router: GameInfoRouter) {
        self.game = game
        self.router = router
    }

    func didLoad(ui: GameInfoViewProtocol) {
        self.ui = ui
        ui.set(model: GameInfoViewData(with: game))
    }
}


// MARK: Presenter protocol
extension GameInfoPresenter: GameInfoPresenterProtocol {

    func getGameEnviroment(with index: Int) -> GameEnviroment {
        game.gameEnviroments[index]
    }

    func didClickCollectionAt(indexPath: IndexPath) {
        let section = gameInfoSections[indexPath.section]
        guard section == .gameEnviroment else { return }
        let gameEnviroment = game.gameEnviroments[indexPath.item]
        router.showGameEnviromentScreen(with: gameEnviroment)
    }

    func getGame() -> Game { game }
    func getGameDescription() -> String { game.description }
    func getGameInfoSection(with index: Int) -> GameInfoSection { gameInfoSections[index] }

    func numberOfRows(in section: Int) -> Int {
        let gameInfoSection = gameInfoSections[section]
        let numberOfItems: Int
        switch gameInfoSection {
        case .screenshots:
            numberOfItems = game.getScreenshots().count
        case .description:
            numberOfItems = 1
        case .gameEnviroment:
            numberOfItems = game.gameEnviroments.count
        }

        return numberOfItems
    }

    func numberOfSections() -> Int { gameInfoSections.count }

    func headerTitleFor(section: Int) -> String { gameInfoSections[section].title }
}


