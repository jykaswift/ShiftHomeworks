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
        let enviromentButton = UIButton(configuration: .gray())
        enviromentButton.translatesAutoresizingMaskIntoConstraints = false
        enviromentButton.isUserInteractionEnabled = false
        return enviromentButton
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupGameEnviroment(with gameEnviroment: GameEnviroment) {
        enviromentButton.configuration?.title = gameEnviroment.name.rawValue
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
            enviromentButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            enviromentButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}

