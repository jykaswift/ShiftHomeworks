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

class CreateCarViewController: UIViewController {

    private lazy var createCarView = CreateCarView()

    weak var delegate: CreateCarDelegate?

    override func loadView() {
        view = createCarView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()

    }

}

// MARK: NavBar
extension CreateCarViewController {
    func setupNavigationBar() {

        let saveAction = UIAction {[weak self] _ in
            guard let self else { return }
            guard createCarView.isInputsValid() else {
                showValidErrorAlert()
                return
            }
            let car = createCarView.getCar()
            delegate?.saveCar(car: car)
            navigationController?.popViewController(animated: true)

        }

        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .save, primaryAction: saveAction)

    }

    private func showValidErrorAlert() {
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
