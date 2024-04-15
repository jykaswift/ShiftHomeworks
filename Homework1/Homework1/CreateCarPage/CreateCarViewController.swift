//
//  CreateCarViewController.swift
//  AutomobileAccounting
//
//  Created by Евгений Борисов on 09.04.2024.
//

import UIKit

protocol CreateCarDelegate: AnyObject {
    func saveCar(car: Car)
}

class CreateCarViewController: UIViewController, CreateCarViewDelegate {
    var lastSelectedPickerRow: Int?
    var bodyTypes = Body.allCases.map { $0.rawValue }

    private lazy var createCarView = CreateCarView(delegage: self)

    weak var delegate: CreateCarDelegate?

    override func loadView() {
        view = createCarView

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()

    }
}

// MARK: View's textfields
private extension CreateCarViewController {
    var manufactorerText: String? {
        createCarView.manufacturerTextField.text
    }

    var modelText: String? {
        createCarView.modelTextField.text
    }

    var bodyText: String? {
        createCarView.bodyTextField.text
    }

    var yearOfIssueText: String? {
        createCarView.yearOfIssueTextField.text
    }

    var carNumberText: String? {
        createCarView.carNumberTextField.text
    }


    
}

// MARK: NavBar
private extension CreateCarViewController {
    func setupNavigationBar() {
        let saveAction = UIAction { [weak self] _ in
            guard let self else { return }

            let carValidator = CarValidator()
            let car = carValidator.validateCarData(
                manufacturer: manufactorerText,
                model: modelText,
                body: bodyText,
                yearOfIssue: yearOfIssueText,
                carNumber: carNumberText
            )

            guard let car else {
                self.showValidErrorAlert()
                return
            }
            
            delegate?.saveCar(car: car)
            navigationController?.popViewController(animated: true)
        }

        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .save, primaryAction: saveAction)
    }

    func showValidErrorAlert() {
        let validErrorAlert = UIAlertController(
            title: "Не все поля заполнены",
            message: "Пожалуйста заполните все поля отмеченные звездочкой",
            preferredStyle: .alert
        )

        let okAction = UIAlertAction(title: "OK", style: .default)
        validErrorAlert.addAction(okAction)
        present(validErrorAlert, animated: true)
    }
}


// MARK: Picker View
extension CreateCarViewController {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        bodyTypes.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        bodyTypes[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lastSelectedPickerRow = row
    }
}
