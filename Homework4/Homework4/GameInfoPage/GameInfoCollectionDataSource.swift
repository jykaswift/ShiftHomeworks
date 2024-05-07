//
//  GameInfoCollectionDataSource.swift
//  Homework4
//
//  Created by Евгений Борисов on 07.05.2024.
//

import UIKit

class GameInfoCollectionDataSource: NSObject, UICollectionViewDataSource {
    
    let game: Game
    let sections = GameInfoSection.allCases

    init(game: Game) {
        self.game = game
        super.init()
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let gameInfoSection = sections[section]
        let numberOfItems: Int
        switch gameInfoSection {
        case .screenshots:
            numberOfItems = game.screenshots.count
        case .description:
            numberOfItems = 1
        case .gameEnviroment:
            numberOfItems = game.gameEnviroments.count
        }

        return numberOfItems
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let gameInfoSection = sections[indexPath.section]


        switch gameInfoSection {

        case .screenshots:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScreenshotCollectionCell.identifier, for: indexPath) as? ScreenshotCollectionCell
            else { return UICollectionViewCell() }
            cell.screenshotImage = game.screenshots[indexPath.row]
            return cell
        case .description:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DescriptionCollectionCell.identifier, for: indexPath) as? DescriptionCollectionCell
            else { return UICollectionViewCell() }
            cell.gameDescription = game.description
            return cell
        case .gameEnviroment:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameEnviromentsCollectionCell.identifier, for: indexPath) as? GameEnviromentsCollectionCell
            else { return UICollectionViewCell() }
            cell.setupEnvorentalButton(with: game.gameEnviroments[indexPath.row])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind, 
                withReuseIdentifier: HeaderSuplementaryView.identifier,
                for: indexPath
            ) as? HeaderSuplementaryView else { return UICollectionReusableView() }
            header.headerText = sections[indexPath.section].title
            return header
        default:
            return UICollectionViewCell()
        }
    }

}
