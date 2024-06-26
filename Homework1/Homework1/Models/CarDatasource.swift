//
//  DataSource.swift
//  AutomobileAccounting
//
//  Created by Евгений Борисов on 09.04.2024.
//

import Foundation

class CarDatasource {

    private(set) var datasource: [Car] = [
        Car(manufacturer: "Mercedes-Benz", model: "A250e", body: .hatchback),
        Car(manufacturer: "Lincoln", model: "Town Car", body: .limousine, yearOfIssue: 1998, carNumber: "1s12a"),
        Car(manufacturer: "BMW", model: "Cabrio", body: .cabriolet, yearOfIssue: 2001)
    ]
    private var sortedState: Body?

    func getSortedDatasource() -> [Car] {
        guard let sortedState else { return self.datasource }

        return datasource.filter { car in
            car.body == sortedState
        }
    }

    func addCar(_ car: Car) {
        datasource.append(car)
    }

    func setSortedState(with body: Body?) {
        sortedState = body
    }
}
