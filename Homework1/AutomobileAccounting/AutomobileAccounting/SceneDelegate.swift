//
//  SceneDelegate.swift
//  AutomobileAccounting
//
//  Created by Евгений Борисов on 09.04.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: scene.screen.bounds)
        window?.windowScene = scene
        window?.rootViewController = UINavigationController(rootViewController: CarsViewController())
        window?.makeKeyAndVisible()
    }
}

