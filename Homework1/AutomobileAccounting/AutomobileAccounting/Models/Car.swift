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

enum Body: String, CaseIterable {
    case sedan = "Седан"
    case cabriolet = "Кабриолет"
}
