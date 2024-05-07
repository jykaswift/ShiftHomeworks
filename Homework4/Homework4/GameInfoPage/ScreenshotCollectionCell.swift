//
//  ScreenshotCollectionCell.swift
//  Homework4
//
//  Created by Евгений Борисов on 07.05.2024.
//

import UIKit

class ScreenshotCollectionCell: UICollectionViewCell {

    static let identifier = String(describing: ScreenshotCollectionCell.self)

    private lazy var screenshotImageView = {
        let screenshotImageView = UIImageView()
        screenshotImageView.translatesAutoresizingMaskIntoConstraints = false
        screenshotImageView.contentMode = .scaleAspectFill

        return screenshotImageView
    }()

    var screenshotImage: UIImage? {
        get {
            screenshotImageView.image
        }

        set {
            screenshotImageView.image = newValue
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
private extension ScreenshotCollectionCell {
    func setupUI() {
        contentView.backgroundColor = .none
        addSubviews()
        setupLayout()
    }

    func addSubviews() {
        contentView.addSubview(screenshotImageView)
    }

    func setupLayout() {
        NSLayoutConstraint.activate([
            screenshotImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            screenshotImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            screenshotImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            screenshotImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
