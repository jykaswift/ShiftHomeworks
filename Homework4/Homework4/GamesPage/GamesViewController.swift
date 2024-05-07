//
//  ViewController.swift
//  Homework4
//
//  Created by Евгений Борисов on 07.05.2024.
//

import UIKit

class GamesViewController: UIViewController {

    private lazy var gamesView = GamesView()
    private lazy var collectionViewDataSource = GamesCollectionDataSource()
    override func loadView() {
        view = gamesView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupCollectionView()
    }
}

// MARK: Navigation Bar
private extension GamesViewController {
    func setupNavigation() {
        navigationItem.title = "Games"
    }
}


// MARK: Setup CollectionView Delegates
extension GamesViewController: UICollectionViewDelegate {
    func setupCollectionView() {
        gamesView.gamesCollectionView.dataSource = collectionViewDataSource
        gamesView.gamesCollectionView.delegate = self
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(GameInfoViewController(), animated: true)
    }
}
