//
//  GamesView.swift
//  Homework4
//
//  Created by Евгений Борисов on 07.05.2024.
//
import UIKit

class GamesView: UIView {

    lazy var gamesCollectionView: UICollectionView = {
        let collectionLayout = createLayout()
        let gamesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        gamesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        gamesCollectionView.register(GamesCellView.self, forCellWithReuseIdentifier: GamesCellView.identifier)
        return gamesCollectionView
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


// MARK: CollectionView Layout
private extension GamesView {
    func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))

        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(150))

        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        group.contentInsets = .init(top: 5, leading: 0, bottom: 5, trailing: 0)

        let section = NSCollectionLayoutSection(group: group)

        section.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 10)

        return UICollectionViewCompositionalLayout(section: section)
    }
}


// MARK: Setup UI
private extension GamesView {
    func setupUI() {
        backgroundColor = .white
        addSubviews()
        setupLayout()
    }

    func addSubviews() {
        addSubview(gamesCollectionView)
    }

    func setupLayout() {
        NSLayoutConstraint.activate([
            gamesCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            gamesCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            gamesCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            gamesCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
