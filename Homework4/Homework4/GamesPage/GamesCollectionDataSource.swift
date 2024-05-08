//
//  GamesCollectionDataSource.swift
//  Homework4
//
//  Created by Евгений Борисов on 07.05.2024.
//

import UIKit

class GamesCollectionDataSource: NSObject, UICollectionViewDataSource {

    let dataSource = DataSource.shared

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: GamesCellView.identifier,
            for: indexPath
        ) as? GamesCellView
        else { return UICollectionViewCell() }

        cell.setupGame(dataSource[indexPath.item])
        return cell
    }
}
