//
//  GameEnviromentsCollectionCell.swift
//  Homework4
//
//  Created by Евгений Борисов on 07.05.2024.
//

import UIKit

class GameEnviromentsCollectionCell: UICollectionViewCell {

    static let identifier = String(describing: GameEnviromentsCollectionCell.self)

    private lazy var enviromentButton: UIButton = {
        let enviromentButton = UIButton()
        enviromentButton.translatesAutoresizingMaskIntoConstraints = false
        return enviromentButton
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupEnvorentalButton(with gameEnviroment: GameEnviroment) {
        enviromentButton.setTitle(gameEnviroment.name.rawValue, for: .normal)
    }

}


// MARK: Setup UI
private extension GameEnviromentsCollectionCell {
    func setupUI() {
        contentView.backgroundColor = .none
        addSubviews()
        setupLayout()
    }

    func addSubviews() {
        contentView.addSubview(enviromentButton)
    }

    func setupLayout() {
        NSLayoutConstraint.activate([
            enviromentButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            enviromentButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            enviromentButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            enviromentButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}

