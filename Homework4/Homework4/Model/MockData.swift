//
//  MockData.swift
//  Homework4
//
//  Created by Евгений Борисов on 07.05.2024.
//

import Foundation
import UIKit
class MockData {

    static func getMockData() -> [Game] {
        var data = [Game]()

        var battleField = Game(
            name: "Battlefield 1",
            avatar: UIImage(named: "Battlefield_1"),
            description: """
            Battlefield 1 (also known as BF1 and development code-named 'Tunguska') is the fifteenth installment in the Battlefield Series developed by DICE and published by EA.
            The game is set during World War I. It marks the first installment exclusive to eighth-generation consoles and was released worldwide on October 21, 2016.
            """,
            gameEnviroments: getRandomMockEnviroment()
        )
        battleField.screenshots = [
            UIImage(named: "bf1_1"),
            UIImage(named: "bf1_2"),
            UIImage(named: "bf1_3")
        ]

        var bordelands = Game(
            name: "Borderlands",
            avatar: UIImage(named: "Borderlands"),
            description: """
            Borderlands is an action role-playing first-person looter shooter video game franchise set in a space Western science fantasy setting.
            Created and produced by Gearbox Software and published by 2K for multiple platforms.
            """,
            gameEnviroments: getRandomMockEnviroment()
        )

        bordelands.screenshots = [
            UIImage(named: "br1_1"),
            UIImage(named: "br1_2")
        ]

        data.append(battleField)
        data.append(bordelands)

        for _ in 1...20 {
            data.append(generateRandomGame())
        }

        return data
    }

    static func generateRandomGame() -> Game {
        Game(
            name: getRandomString(length: Int.random(in: 5...25)),
            description: getRandomString(length: Int.random(in: 20...100)),
            gameEnviroments: getRandomMockEnviroment()
        )
    }

    static func getRandomMockEnviroment() -> [GameEnviroment] {
        let gameEnviroments: [Int: [GameEnviroment]] = [
            1: [
                GameEnviroment(name: .crossover, availibility: .playable),
                GameEnviroment(name: .rosseta2, availibility: .perfect),
                GameEnviroment(name: .wine, availibility: .unplayble)
            ],

            2: [
                GameEnviroment(name: .crossover, availibility: .playable)
            ],

            3: [
                GameEnviroment(name: .crossover, availibility: .playable),
                GameEnviroment(name: .wine, availibility: .unplayble)
            ]
        ]

        return gameEnviroments[Int.random(in: 1...3)]!
    }

    static func getRandomString(length: Int) -> String {
      let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
      return String((0..<length).map { _ in letters.randomElement()! })
    }
}
