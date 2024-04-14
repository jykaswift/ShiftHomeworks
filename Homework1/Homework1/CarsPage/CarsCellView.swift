//
//  CellView.swift
//  Homework1
//
//  Created by Евгений Борисов on 14.04.2024.
//

import UIKit

class CarsCellView: UIStackView {

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


    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupData(with car: Car) {
        manufacturerLabel.text = car.manufacturerDescription
        modelLabel.text = car.modelDescription
        bodyLabel.text = car.bodyDescription
        yearOfIssueLabel.text = car.yearDescription

        if let carNumberDescription = car.carNumberDescription {
            carNumberLabel.text = carNumberDescription
            carNumberLabel.isHidden = false
        } else {
            carNumberLabel.isHidden = true
        }
    }
}


// MARK: Setup view
private extension CarsCellView {
    func setupView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .systemGray6
        self.layer.cornerRadius = 5
        self.axis = .vertical
        self.spacing = 5
        self.isLayoutMarginsRelativeArrangement = true
        self.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)

        addSubviews()
    }

    func addSubviews() {
        self.addArrangedSubview(manufacturerLabel)
        self.addArrangedSubview(modelLabel)
        self.addArrangedSubview(bodyLabel)
        self.addArrangedSubview(yearOfIssueLabel)
        self.addArrangedSubview(carNumberLabel)
    }

}
