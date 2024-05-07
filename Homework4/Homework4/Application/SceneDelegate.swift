//
//  SceneDelegate.swift
//  Homework4
//
//  Created by Евгений Борисов on 07.05.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.screen.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = UINavigationController(rootViewController: GamesViewController())
        window?.makeKeyAndVisible()
    }
}

