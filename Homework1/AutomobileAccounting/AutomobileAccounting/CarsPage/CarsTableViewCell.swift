//
//  CarsTableViewCell.swift
//  AutomobileAccounting
//
//  Created by Евгений Борисов on 09.04.2024.
//

import UIKit

class CarsTableViewCell: UITableViewCell {

    private lazy var cellStackView: UIStackView = {
        let cellView = UIStackView()
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.backgroundColor = .systemGray6
        cellView.layer.cornerRadius = 5
        cellView.axis = .vertical
        cellView.spacing = 5
        cellView.isLayoutMarginsRelativeArrangement = true
        cellView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        return cellView
    }()

    private lazy var manufacturerLabel: UILabel = {
        let manufacturerLabel = UILabel()
        manufacturerLabel.translatesAutoresizingMaskIntoConstraints = false
        manufacturerLabel.textColor = .black
        return manufacturerLabel
    }()

    private lazy var modelLabel: UILabel = {
        let modelLabel = UILabel()
        modelLabel.translatesAutoresizingMaskIntoConstraints = false
        modelLabel.textColor = .black
        return modelLabel
    }()

    private lazy var bodyLabel: UILabel = {
        let bodyLabel = UILabel()
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        bodyLabel.textColor = .black
        return bodyLabel
    }()

    private lazy var yearOfIssueLabel: UILabel = {
        let yearOfIssueLabel = UILabel()
        yearOfIssueLabel.translatesAutoresizingMaskIntoConstraints = false
        yearOfIssueLabel.textColor = .black
        return yearOfIssueLabel
    }()

    private lazy var carNumberLabel: UILabel = {
        let carNumberLabel = UILabel()
        carNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        carNumberLabel.textColor = .black
        return carNumberLabel
    }()

    func setupCell(with car: Car) {
        manufacturerLabel.text = "Марка: \(car.manufacturer)"
        modelLabel.text = "Модель: \(car.model)"
        bodyLabel.text = "Тип кузова: \(car.body.rawValue)"

        if let year = car.yearOfIssue {
            yearOfIssueLabel.text = "Лет эксплоатации: \(year)"
        } else {
            yearOfIssueLabel.text = "Лет эксплоатации: -"
        }

        if let carNumber = car.carNumber {
            carNumberLabel.text = "Гос. номер: \(carNumber)"
        } else {
            carNumberLabel.isHidden = true
        }

        setupUI()
    }

}

// MARK: Setup UI
extension CarsTableViewCell {
    private func setupUI() {
        addSubviews()
        setupLayout()
    }

    private func addSubviews() {

        contentView.addSubview(cellStackView)

        let views = [
            manufacturerLabel,
            modelLabel,
            bodyLabel,
            yearOfIssueLabel,
            carNumberLabel
        ]

        for view in views {
            cellStackView.addArrangedSubview(view)
        }
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            cellStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            cellStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            cellStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            cellStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
}

extension CarsTableViewCell {
    static var identifier: String {
        "CarsTableViewCell"
    }
}
