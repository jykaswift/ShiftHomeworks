//
//  CarsTableViewCell.swift
//  AutomobileAccounting
//
//  Created by Евгений Борисов on 09.04.2024.
//

import UIKit

class CarsTableViewCell: UITableViewCell {
    static var identifier = String(describing: CarsTableViewCell.self)

    private lazy var cellView = CarsCellView()

    func setupCell(with car: Car) {
        cellView.setupData(with: car)
        self.setupUI()
    }

}

// MARK: Setup UI
extension CarsTableViewCell {
    private func setupUI() {
        self.addSubviews()
        self.setupLayout()
    }

    private func addSubviews() {
        contentView.addSubview(cellView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
}
