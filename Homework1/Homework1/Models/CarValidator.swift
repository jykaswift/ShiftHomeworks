//
//  CarValidator.swift
//  AutomobileAccounting
//
//  Created by Евгений Борисов on 10.04.2024.
//

import Foundation

class CarValidator {
    func validateCarData(
        manufacturer: String?,
        model: String?,
        body: String?,
        yearOfIssue: String?,
        carNumber: String?
    ) -> Car? {
        let validatedManufacturer = self.validateManufacturer(manufacturer)
        let validatedModel = self.validateModel(model)
        let validatedBody = self.validateBody(body)
        let validatedYearOfIssue = self.validateYearOfIssue(yearOfIssue)
        let validatedCarNumber = self.validateCarNumber(carNumber)

        guard let validatedModel, let validatedBody, let validatedManufacturer
        else { return nil }

        return Car(
            manufacturer: validatedManufacturer,
            model: validatedModel,
            body: validatedBody,
            yearOfIssue: validatedYearOfIssue,
            carNumber: validatedCarNumber
        )
    }

    private func validateManufacturer(_ manufacturer: String?) -> String? {
        guard let manufacturer = self.validateNilOrEmptyString(value: manufacturer) else { return nil }
        return manufacturer
    }

    private func validateModel(_ model: String?) -> String? {
        guard let model = self.validateNilOrEmptyString(value: model) else { return nil }
        return model
    }

    private func validateBody(_ body: String?) -> Body? {
        if let body, let resultBody = Body(rawValue: body) {
            return resultBody
        } else {
            return nil
        }
    }

    private func validateYearOfIssue(_ yearOfIssue: String?) -> Int? {
        guard let yearOfIssue = self.validateNilOrEmptyString(value: yearOfIssue) else { return nil }
        let calendar = Calendar.current
        let currentYear = calendar.component(.year, from: Date())
        let dateFirstCar = 1885
        guard let intYearOfIssue = Int(yearOfIssue), (dateFirstCar...currentYear).contains(intYearOfIssue)
        else { return nil }

        return intYearOfIssue
    }

    private func validateCarNumber(_ carNumber: String?) -> String? {
        guard let carNumber = self.validateNilOrEmptyString(value: carNumber) else { return nil }
        return carNumber
    }

    private func validateNilOrEmptyString(value: String?) -> String? {
        if let value, !value.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return value
        } else {
            return nil
        }
    }
}
