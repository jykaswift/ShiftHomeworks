//
//  TabBarController.swift
//  Homework3
//
//  Created by Евгений Борисов on 26.04.2024.
//

import UIKit

class TabBarController: UITabBarController {

    private lazy var profileController: UIViewController = {
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let profileController = mainStoryBoard.instantiateViewController(withIdentifier: "ProfileController") as! ProfileController
        profileController.tabBarItem.title = "Профиль"
        profileController.tabBarItem.image = UIImage(systemName: "person.circle.fill")
        return profileController
    }()

    private lazy var skillController: UIViewController = {
        let skillController = SkillsController()
        skillController.tabBarItem.title = "Навыки"
        skillController.tabBarItem.image = UIImage(systemName: "info.square.fill")
        return skillController
    }()

    private lazy var hobbiesConroller: UIViewController = {
        let hobbiesConroller = HobbiesController()
        hobbiesConroller.tabBarItem.title = "Хобби"
        hobbiesConroller.tabBarItem.image = UIImage(systemName: "dumbbell.fill")
        return hobbiesConroller
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
        setupAppereance()
    }

    private func setupAppereance() {
        tabBar.tintColor = .black
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        tabBar.scrollEdgeAppearance = appearance
    }

    private func setupControllers() {
        viewControllers = [
            profileController,
            skillController,
            hobbiesConroller
        ]
    }

}
