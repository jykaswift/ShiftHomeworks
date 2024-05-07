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
        var battleField = Game(
            name: "Battlefield 1",
            avatar: UIImage(named: "Battlefield_1"),
            description: """
            Battlefield 1 (also known as BF1 and development code-named 'Tunguska') is the fifteenth installment in the Battlefield Series developed by DICE and published by EA.
            The game is set during World War I. It marks the first installment exclusive to eighth-generation consoles and was released worldwide on October 21, 2016.
            """
        )
        battleField.screenshots = [
            UIImage(named: "bf1_1"),
            UIImage(named: "bf1_2"),
            UIImage(named: "bf1_3"),
        ]

        battleField.gameEnviroments = [
            GameEnviroment(name: .crossover, availibility: .playable),
            GameEnviroment(name: .rosseta2, availibility: .perfect),
            GameEnviroment(name: .wine, availibility: .unplayble),
        ]

        var bordelands = Game(
            name: "Borderlands",
            avatar: UIImage(named: "Borderlands"),
            description: """
            Borderlands is an action role-playing first-person looter shooter video game franchise set in a space Western science fantasy setting.
            Created and produced by Gearbox Software and published by 2K for multiple platforms.
            """
        )

        bordelands.screenshots = [
            UIImage(named: "br1_1"),
            UIImage(named: "br1_2"),
        ]

        return [
            battleField,
            bordelands
        ]
    }
}
