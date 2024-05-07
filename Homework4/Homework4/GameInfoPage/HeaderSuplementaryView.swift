//
//  HeaderSuplementaryView.swift
//  Homework4
//
//  Created by Евгений Борисов on 07.05.2024.
//

import UIKit

class HeaderSuplementaryView: UICollectionReusableView {
    static let identifier = String(describing: HeaderSuplementaryView.self)

    private lazy var headerLabel: UILabel = {
        let headerLabel = UILabel()
        headerLabel.textAlignment = .center
        headerLabel.font = UIFont.systemFont(ofSize: 18)
        headerLabel.textColor = .systemGray
        headerLabel.translatesAutoresizingMaskIntoConstraints = false

        return headerLabel
    }()

    var headerText: String? {
        get {
            headerLabel.text
        }
        set {
            headerLabel.text = newValue
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Setup UI
private extension HeaderSuplementaryView {
    func setupUI() {
        backgroundColor = .white
        addSubviews()
        setupLayout()
    }

    func addSubviews() {
        addSubview(headerLabel)
    }

    func setupLayout() {
        NSLayoutConstraint.activate([
            headerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            headerLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
