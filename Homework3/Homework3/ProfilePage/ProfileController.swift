//
//  ViewController.swift
//  Homework3
//
//  Created by Евгений Борисов on 26.04.2024.
//

import UIKit

class ProfileController: UIViewController {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var marriedSwitch: UISwitch!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var secondNameLabel: UILabel!
    @IBOutlet weak var residenceCityLabel: UILabel!
    @IBOutlet weak var birthCityLabel: UILabel!

    let dataSource = DataSource.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
    }

    private func setupData() {
        nameLabel.text = dataSource.user.userCommonInfo.name
        secondNameLabel.text = dataSource.user.userCommonInfo.secondName
        residenceCityLabel.text = dataSource.user.userCommonInfo.residenceСity
        birthCityLabel.text = dataSource.user.userCommonInfo.birthCity
        marriedSwitch.setOn(dataSource.user.userCommonInfo.isMarried, animated: false)
        avatarImageView.image = dataSource.user.userCommonInfo.avatar
    }
}

