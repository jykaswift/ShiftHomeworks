//
//  GameInfoView.swift
//  Homework4
//
//  Created by Евгений Борисов on 07.05.2024.
//

import Foundation
import UIKit

class GameInfoView: UIView {
    lazy var gameInfoCollectionView: UICollectionView = {
        let collectionLayout = createCompositionalLayout()
        let gameInfoCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
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
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout {[weak self] sectionIndex, _ in
            guard let self else { return nil }
            let section = GameInfoSection.allCases[sectionIndex]

            switch section {
            case .screenshots:
                return self.createScreenshotSection()
            case .description:
                return self.createDescriptionSection()
            case .gameEnviroment:
                return self.createGameEnviromentSection()
            }
        }
    }


    func createScreenshotSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .absolute(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 5, leading: 0, bottom: 5, trailing: 0)
        section.orthogonalScrollingBehavior = .groupPaging
        section.interGroupSpacing = 5

        return section
    }

    func createDescriptionSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(150))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)

        return section
    }

    func createGameEnviromentSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(200))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)

        return section
    }

}
