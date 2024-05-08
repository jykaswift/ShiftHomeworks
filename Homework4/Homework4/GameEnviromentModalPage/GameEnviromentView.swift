//
//  GameEnviromentView.swift
//  Homework4
//
//  Created by Евгений Борисов on 07.05.2024.
//

import UIKit

class GameEnviromentView: UIView {

    private lazy var enviromentTitleLabel: UILabel = {
        let enviromentTitleLabel = UILabel()
        enviromentTitleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        enviromentTitleLabel.textColor = .black
        enviromentTitleLabel.translatesAutoresizingMaskIntoConstraints = false

        return enviromentTitleLabel
    }()

    private lazy var availibilityTitleLabel: UILabel = {
        let availibilityTitleLabel = UILabel()
        availibilityTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        availibilityTitleLabel.font = UIFont.systemFont(ofSize: 16)
        availibilityTitleLabel.text = "Availibility: "
        return availibilityTitleLabel
    }()

    private lazy var availibilityLabel: UILabel = {
        let availibilityLabel = UILabel()
        availibilityLabel.translatesAutoresizingMaskIntoConstraints = false
        availibilityLabel.font = UIFont.systemFont(ofSize: 16)
        return availibilityLabel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupGameEnviroment(_ gameEnviroment: GameEnviroment) {
        enviromentTitleLabel.text = gameEnviroment.name.rawValue

        let availibility = gameEnviroment.availibility

        switch availibility {
        case .perfect:
            availibilityLabel.textColor = .green
        case .playable:
            availibilityLabel.textColor = .orange
        case .unplayble:
            availibilityLabel.textColor = .red
        }

        availibilityLabel.text = availibility.rawValue
    }
}

private extension GameEnviromentView {
    func setupUI() {
        backgroundColor = .white
        addSubviews()
        setupLayout()
    }

    func addSubviews() {
        addSubview(enviromentTitleLabel)
        addSubview(availibilityTitleLabel)
        addSubview(availibilityLabel)
    }

    func setupLayout() {

        NSLayoutConstraint.activate([
            enviromentTitleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            enviromentTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            availibilityTitleLabel.topAnchor.constraint(equalTo: enviromentTitleLabel.bottomAnchor, constant: 10),
            availibilityTitleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 5),

            availibilityLabel.leadingAnchor.constraint(equalTo: availibilityTitleLabel.trailingAnchor, constant: 5),
            availibilityLabel.centerYAnchor.constraint(equalTo: availibilityTitleLabel.centerYAnchor)
        ])

    }
}
