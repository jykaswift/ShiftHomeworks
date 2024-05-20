//
//  GamesCellView.swift
//  Homework4
//
//  Created by Евгений Борисов on 07.05.2024.
//

import UIKit

class GamesCellView: UICollectionViewCell {

    static let identifier = String(describing: GamesCellView.self)

    private lazy var gameImageView: UIImageView = {
        let gameImageView = UIImageView()
        gameImageView.contentMode = .scaleAspectFill
        gameImageView.clipsToBounds = true
        gameImageView.translatesAutoresizingMaskIntoConstraints = false
        gameImageView.layer.cornerRadius = 8
        return gameImageView
    }()

    private lazy var gameNameLabel: UILabel = {
        let gameNameLabel = UILabel()
        gameNameLabel.font = Constants.labelFont
        gameNameLabel.translatesAutoresizingMaskIntoConstraints = false
        gameNameLabel.numberOfLines = 0
        gameNameLabel.textAlignment = .center
        return gameNameLabel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupGame(_ game: Game) {
        gameImageView.image = game.avatar
        gameNameLabel.text = game.name
    }
}

// MARK: Setup UI
private extension GamesCellView {
    func setupUI() {
        contentView.backgroundColor = .systemGray6
        contentView.layer.cornerRadius = 12
        addSubviews()
        setupLayout()
    }

    func addSubviews() {
        contentView.addSubview(gameImageView)
        contentView.addSubview(gameNameLabel)
    }

    func setupLayout() {
        contentView.directionalLayoutMargins = .init(top: 5, leading: 5, bottom: 5, trailing: 5)
        let layoutMargin = contentView.layoutMarginsGuide

        NSLayoutConstraint.activate([
            gameImageView.topAnchor.constraint(equalTo: layoutMargin.topAnchor),
            gameImageView.leadingAnchor.constraint(equalTo: layoutMargin.leadingAnchor),
            gameImageView.bottomAnchor.constraint(equalTo: layoutMargin.bottomAnchor),
            gameImageView.widthAnchor.constraint(equalToConstant: 100),

            gameNameLabel.topAnchor.constraint(equalTo: layoutMargin.topAnchor),
            gameNameLabel.trailingAnchor.constraint(equalTo: layoutMargin.trailingAnchor),
            gameNameLabel.bottomAnchor.constraint(equalTo: layoutMargin.bottomAnchor),
            gameNameLabel.leadingAnchor.constraint(equalTo: gameImageView.trailingAnchor, constant: 10)
        ])
    }
}
