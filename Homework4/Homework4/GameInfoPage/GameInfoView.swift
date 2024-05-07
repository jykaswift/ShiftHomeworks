//
//  GameInfoView.swift
//  Homework4
//
//  Created by Евгений Борисов on 07.05.2024.
//

import Foundation
import UIKit

class GameInfoView: UIView {
    private lazy var gameInfoCollectionView: UICollectionView = {
        let gameInfoCollectionView = UICollectionView()
        gameInfoCollectionView.translatesAutoresizingMaskIntoConstraints = false
        gameInfoCollectionView.register(ScreenshotCollectionCell.self, forCellWithReuseIdentifier: ScreenshotCollectionCell.identifier)
        gameInfoCollectionView.register(DescriptionCollectionCell.self, forCellWithReuseIdentifier: DescriptionCollectionCell.identifier)
        gameInfoCollectionView.register(GameEnviromentsCollectionCell.self, forCellWithReuseIdentifier: GameEnviromentsCollectionCell.identifier)
        gameInfoCollectionView.backgroundColor = .none
        return gameInfoCollectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: Setup UI
private extension GameInfoView {
    func setupUI() {
        backgroundColor = .white
        addSubviews()
        setupLayout()
    }

    func addSubviews() {
        addSubview(gameInfoCollectionView)
    }

    func setupLayout() {
        NSLayoutConstraint.activate([
            gameInfoCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            gameInfoCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            gameInfoCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            gameInfoCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])

    }
}


// MARK: Collection View Layout
private extension GameInfoView {
//    func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
//        UICollectionViewCompositionalLayout { sectionIndex, _ in
//            let section = GameInfoSection.allCases[sectionIndex]
//
//            switch section {
//            case .screenshots:
//
//            case .description:
//                <#code#>
//            case .gameEnviroment:
//                <#code#>
//            }
//        }
//    }


}
