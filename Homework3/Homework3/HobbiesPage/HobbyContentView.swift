//
//  ContentView.swift
//  Homework3
//
//  Created by Евгений Борисов on 28.04.2024.
//

import UIKit

class HobbyContentView: UIView {

    private lazy var hobbyTitleNameLabel: UILabel = {
        let hobbyTitleNameLabel = UILabel()
        hobbyTitleNameLabel.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        hobbyTitleNameLabel.textColor = .black
        hobbyTitleNameLabel.translatesAutoresizingMaskIntoConstraints = false
        hobbyTitleNameLabel.adjustsFontSizeToFitWidth = true
        hobbyTitleNameLabel.textAlignment = .center
        return hobbyTitleNameLabel
    }()

    private lazy var hobbyImageView: UIImageView = {
        let hobbyImageView = UIImageView()
        hobbyImageView.translatesAutoresizingMaskIntoConstraints = false
        hobbyImageView.image = UIImage(named: "hobby")
        hobbyImageView.contentMode = .scaleAspectFit
        hobbyImageView.clipsToBounds = true
        return hobbyImageView
    }()

    private lazy var hobbyDescription: UILabel = {
        let hobbyDescription = UILabel()
        hobbyDescription.numberOfLines = 0
        hobbyDescription.font = UIFont.systemFont(ofSize: 20)
        hobbyDescription.translatesAutoresizingMaskIntoConstraints = false
        hobbyDescription.adjustsFontSizeToFitWidth = true
        return hobbyDescription
    }()

    private var screenWidth: CGFloat {
        UIScreen.current?.bounds.width ?? 0
    }

    convenience init(hobby: Hobby) {
        self.init(frame: .zero)
        setupData(with: hobby)
        setupView()
    }

}

private extension HobbyContentView {
    func setupData(with hobby: Hobby) {
        hobbyTitleNameLabel.text = hobby.name
        if let image = hobby.image {
            hobbyImageView.image = image
        }
        hobbyDescription.text = hobby.description
    }

    func setupView() {
        backgroundColor = .white

        addSubviews()
        setupLayout()
    }

    func addSubviews() {
        addSubview(hobbyTitleNameLabel)
        addSubview(hobbyImageView)
        addSubview(hobbyDescription)
    }

    func setupLayout() {
        translatesAutoresizingMaskIntoConstraints = false
        directionalLayoutMargins = NSDirectionalEdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15)
        let elementsVerticalMargin: CGFloat = 15

        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: screenWidth),

            hobbyTitleNameLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            hobbyTitleNameLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            hobbyTitleNameLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            hobbyTitleNameLabel.heightAnchor.constraint(equalToConstant: 40),

            hobbyImageView.topAnchor.constraint(equalTo: hobbyTitleNameLabel.bottomAnchor, constant: elementsVerticalMargin),
            hobbyImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 40),
            hobbyImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -40),
            hobbyImageView.heightAnchor.constraint(equalToConstant: 200),

            hobbyDescription.topAnchor.constraint(equalTo: hobbyImageView.bottomAnchor, constant: elementsVerticalMargin),
            hobbyDescription.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            hobbyDescription.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            hobbyDescription.bottomAnchor.constraint(lessThanOrEqualTo: layoutMarginsGuide.bottomAnchor)

        ])
    }
}

