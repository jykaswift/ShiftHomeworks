//
//  GameInfoViewController + TableView.swift
//  Homework4
//
//  Created by Евгений Борисов on 17.05.2024.
//

import UIKit


// MARK: Setup Collection View
extension GameInfoViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func setupCollectionViewDelegates() {
        gameInfoView.gameInfoCollectionView.dataSource = self
        gameInfoView.gameInfoCollectionView.delegate = self
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didClickCollectionAt(indexPath: indexPath)
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        presenter.numberOfSections()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.numberOfRows(in: section)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let gameInfoSection = presenter.getGameInfoSection(with: indexPath.section)

        switch gameInfoSection {
        case .screenshots:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ScreenshotCollectionCell.identifier,
                for: indexPath
            ) as? ScreenshotCollectionCell
            else { return UICollectionViewCell() }
            let game = presenter.getGame()
            cell.screenshotImage = game.getScreenshots()[indexPath.row]
            return cell
        case .description:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: DescriptionCollectionCell.identifier,
                for: indexPath
            ) as? DescriptionCollectionCell
            else { return UICollectionViewCell() }

            cell.gameDescription = presenter.getGameDescription()
            return cell
        case .gameEnviroment:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: GameEnviromentsCollectionCell.identifier,
                for: indexPath
            ) as? GameEnviromentsCollectionCell
            else { return UICollectionViewCell() }

            cell.setupGameEnviroment(with: presenter.getGameEnviroment(with: indexPath.item))
            return cell
        }
    }

    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: HeaderSuplementaryView.identifier,
                for: indexPath
            ) as? HeaderSuplementaryView else { return UICollectionReusableView() }
            header.headerText = presenter.headerTitleFor(section: indexPath.section)
            return header
        default:
            return UICollectionViewCell()
        }
    }

}


