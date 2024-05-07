//
//  GameInfoViewController.swift
//  Homework4
//
//  Created by Евгений Борисов on 07.05.2024.
//

import UIKit

class GameInfoViewController: UIViewController {
    
    private lazy var gameInfoView = GameInfoView()
    private let game: Game
    private lazy var collectionViewDataSource = GameInfoCollectionDataSource(game: game)
    private let sections = GameInfoSection.allCases

    init(game: Game) {
        self.game = game
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = gameInfoView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionViewDelegates()
    }
}

// MARK: Setup CollectionView Delegates
extension GameInfoViewController: UICollectionViewDelegate {
    func setupCollectionViewDelegates() {
        gameInfoView.gameInfoCollectionView.dataSource = collectionViewDataSource
        gameInfoView.gameInfoCollectionView.delegate = self
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let section = sections[indexPath.section]
        
        if section == .gameEnviroment {

            let gameEnviroment = game.gameEnviroments[indexPath.row]
            let controller = GameEnviromentViewController(gameEnviroment: gameEnviroment)
            if let sheet = controller.sheetPresentationController {
                sheet.detents = [.medium()]
            }

            self.present(controller, animated: true)
        }
    }
}
