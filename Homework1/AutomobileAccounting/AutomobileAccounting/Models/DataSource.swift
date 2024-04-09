//
//  DataSource.swift
//  AutomobileAccounting
//
//  Created by Евгений Борисов on 09.04.2024.
//

import Foundation

class CarDatasource {
    private var datasouce = [
        Car(manufacturer: "Mersedec", model: "Gla", body: .sedan, yearOfIssue: 20, carNumber: "2001"),
        Car(manufacturer: "Mersedec", model: "Gla", body: .cabriolet, yearOfIssue: 20),
        Car(manufacturer: "Mersedec", model: "Gla", body: .sedan, yearOfIssue: 20, carNumber: "2001")

    ]

    func getDatasource() -> [Car] {
        return datasouce
    }

    func getSortedDatasource(with bodyType: Body) -> [Car] {
        return datasouce.filter { car in
            car.body == bodyType
        }
    }
}
