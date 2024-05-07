//
//  GameInfoSection.swift
//  Homework4
//
//  Created by Евгений Борисов on 07.05.2024.
//

import Foundation

enum GameInfoSection: CaseIterable {
    case screenshots
    case description
    case gameEnviroment

    var title: String {
        switch self {
        case .screenshots:
            "Скриншоты"
        case .description:
            "Описание"
        case .gameEnviroment:
            "Среды запуска"
        }
    }
}
