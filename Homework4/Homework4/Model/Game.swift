//
//  Game.swift
//  Homework4
//
//  Created by Евгений Борисов on 07.05.2024.
//

import Foundation

import UIKit

struct Game {
    let name: String
    var avatar: UIImage? = UIImage(named: "no_image")
    let description: String
    var screenshots: [UIImage?] = []
    var gameEnviroments: [GameEnviroment] = []
}
