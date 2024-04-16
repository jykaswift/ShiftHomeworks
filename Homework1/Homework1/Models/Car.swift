//
//  Car.swift
//  AutomobileAccounting
//
//  Created by Евгений Борисов on 09.04.2024.
//

import Foundation

struct Car: Hashable {
    var id = UUID()
    var manufacturer: String
    var model: String
    var body: Body
    var yearOfIssue: Int?
    var carNumber: String?
}

// MARK: Car Property Descriptions
extension Car {
    var manufacturerDescription: String {
        "Марка: \(self.manufacturer)"
    }

    var modelDescription: String {
        "Модель: \(self.model)"
    }

    var bodyDescription: String {
        "Тип кузова: \(self.body.rawValue)"
    }

    var yearDescription: String {
        self.yearOfIssue == nil ? "Год выпуска: -" : "Год выпуска: \(self.yearOfIssue!)"
    }

    var carNumberDescription: String? {
        carNumber == nil ? carNumber : "Гос. номер: \(self.carNumber!)"
    }
}

enum Body: String, CaseIterable {
    case sedan = "Седан"
    case cabriolet = "Кабриолет"
    case hatchback = "Хэтчбэк"
    case limousine = "Лимузин"
}
