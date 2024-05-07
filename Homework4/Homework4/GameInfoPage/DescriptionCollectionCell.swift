//
//  DescriptionCollectionCell.swift
//  Homework4
//
//  Created by Евгений Борисов on 07.05.2024.
//

import UIKit

class DescriptionCollectionCell: UICollectionViewCell {

    static let identifier = String(describing: DescriptionCollectionCell.self)

    private lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.numberOfLines = 0
        return descriptionLabel
    }()

    var gameDescription: String? {
        get {
            descriptionLabel.text
        }

        set {
            descriptionLabel.text = newValue
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


// MARK: Setup UI
private extension DescriptionCollectionCell {
    func setupUI() {
        contentView.backgroundColor = .none
        addSubviews()
        setupLayout()
    }

    func addSubviews() {
        contentView.addSubview(descriptionLabel)
    }

    func setupLayout() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor),
        ])
    }
}
