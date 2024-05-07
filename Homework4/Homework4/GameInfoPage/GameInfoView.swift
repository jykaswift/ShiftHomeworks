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
        gameInfoCollectionView.register(
            HeaderSuplementaryView.self, 
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: HeaderSuplementaryView.identifier
        )
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


// MARK: CollectionView Layout
private extension GameInfoView {
    
    enum GroupDirection {
        case vertical
        case horizontal
    }

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

    func createLayoutSection(
        itemSize: NSCollectionLayoutSize,
        groupSize: NSCollectionLayoutSize,
        groupDirection: GroupDirection,
        sectionInsets: NSDirectionalEdgeInsets
    ) -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let group: NSCollectionLayoutGroup

        switch groupDirection {
        case .horizontal:
            group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        case .vertical:
            group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        }
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(30))
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [
            .init(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        ]

        section.contentInsets = sectionInsets
        return section
    }


    func createScreenshotSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.97), heightDimension: .absolute(250))

        let section = createLayoutSection(
            itemSize: itemSize,
            groupSize: groupSize,
            groupDirection: .horizontal,
            sectionInsets: .init(top: 10, leading: 0, bottom: 10, trailing: 0)
        )
        section.orthogonalScrollingBehavior = .groupPaging
        section.interGroupSpacing = 5

        return section
    }

    func createDescriptionSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        let section = createLayoutSection(
            itemSize: itemSize,
            groupSize: groupSize,
            groupDirection: .horizontal,
            sectionInsets: .init(top: 10, leading: 10, bottom: 10, trailing: 10)
        )
        return section
    }

    func createGameEnviromentSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50))
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(100))

        let section = createLayoutSection(
            itemSize: itemSize,
            groupSize: groupSize,
            groupDirection: .vertical,
            sectionInsets: .init(top: 10, leading: 0, bottom: 10, trailing: 0)
        )

        return section
    }

}
