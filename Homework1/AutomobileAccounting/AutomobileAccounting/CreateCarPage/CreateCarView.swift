//
//  CreateCarView.swift
//  AutomobileAccounting
//
//  Created by Евгений Борисов on 09.04.2024.
//

import UIKit

class CreateCarView: UIView {

    private lazy var bodyTypes = Body.allCases.map { $0.rawValue }
    private var lastSelectedRow: Int?

    private lazy var manufacturerLabel: UILabel = {
        let manufacturerLabel = UILabel()
        manufacturerLabel.translatesAutoresizingMaskIntoConstraints = false
        manufacturerLabel.font = UIFont.systemFont(ofSize: 16)
        manufacturerLabel.text = "Введите марку машины \u{002A}"
        return manufacturerLabel
    }()

    private lazy var manufacturerTextField: UITextField = {
        let manufacturerTextField = UITextField()
        manufacturerTextField.translatesAutoresizingMaskIntoConstraints = false
        manufacturerTextField.placeholder = "Марка..."
        manufacturerTextField.borderStyle = .roundedRect
        return manufacturerTextField
    }()

    private lazy var modelLabel: UILabel = {
        let modelLabel = UILabel()
        modelLabel.translatesAutoresizingMaskIntoConstraints = false
        modelLabel.font = UIFont.systemFont(ofSize: 16)
        modelLabel.text = "Введите модель машины \u{002A}"
        return modelLabel
    }()

    private lazy var modelTextField: UITextField = {
        let modelTextField = UITextField()
        modelTextField.translatesAutoresizingMaskIntoConstraints = false
        modelTextField.placeholder = "Модель..."
        modelTextField.borderStyle = .roundedRect
        return modelTextField
    }()

    private lazy var bodyPickerView: UIPickerView = {
        let bodyPickerView = UIPickerView()
        bodyPickerView.delegate = self

        return bodyPickerView
    }()

    private lazy var bodyLabel: UILabel = {
        let modelLabel = UILabel()
        modelLabel.translatesAutoresizingMaskIntoConstraints = false
        modelLabel.font = UIFont.systemFont(ofSize: 16)
        modelLabel.text = "Выберите кузов машины \u{002A}"
        return modelLabel
    }()

    private lazy var bodyTextField: UITextField = {
        let bodyTextField = UITextField()
        bodyTextField.translatesAutoresizingMaskIntoConstraints = false
        bodyTextField.placeholder = "Кузов..."
        bodyTextField.inputView = bodyPickerView
        bodyTextField.borderStyle = .roundedRect
        bodyTextField.inputAccessoryView = createBodyAccessoryView()
        return bodyTextField
    }()

    private lazy var yearOfIssueLabel: UILabel = {
        let yearOfIssueLabel = UILabel()
        yearOfIssueLabel.translatesAutoresizingMaskIntoConstraints = false
        yearOfIssueLabel.font = UIFont.systemFont(ofSize: 16)
        yearOfIssueLabel.text = "Введите год выпуска машины"
        return yearOfIssueLabel
    }()

    private lazy var yearOfIssueTextField: UITextField = {
        let yearOfIssueTextField = UITextField()
        yearOfIssueTextField.translatesAutoresizingMaskIntoConstraints = false
        yearOfIssueTextField.placeholder = "Год выпуска..."
        yearOfIssueTextField.borderStyle = .roundedRect
        yearOfIssueTextField.keyboardType = .numberPad
        return yearOfIssueTextField
    }()

    private lazy var carNumberLabel: UILabel = {
        let carNumberLabel = UILabel()
        carNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        carNumberLabel.font = UIFont.systemFont(ofSize: 16)
        carNumberLabel.text = "Введите государственный номер машины"
        return carNumberLabel
    }()

    private lazy var carNumberTextField: UITextField = {
        let carNumberTextField = UITextField()
        carNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        carNumberTextField.placeholder = "Государственный номер..."
        carNumberTextField.borderStyle = .roundedRect
        return carNumberTextField
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: Setup UI
extension CreateCarView {
    private func setupUI() {
        backgroundColor = .white
        addSubviews()
        setupLayout()

    }

    private func addSubviews() {
        let views = [
            manufacturerLabel,
            manufacturerTextField,
            modelLabel,
            modelTextField,
            bodyLabel,
            bodyTextField,
            yearOfIssueLabel,
            yearOfIssueTextField,
            carNumberLabel,
            carNumberTextField
        ]

        for view in views {
            addSubview(view)
        }
    }

    private func setupLayout() {
        directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        let spacing: CGFloat = 5
        let margin: CGFloat = 10

        NSLayoutConstraint.activate([
            manufacturerLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            manufacturerLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor)
        ])

        NSLayoutConstraint.activate([
            manufacturerTextField.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            manufacturerTextField.topAnchor.constraint(equalTo: manufacturerLabel.bottomAnchor, constant: spacing),
            manufacturerTextField.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor)
        ])

        NSLayoutConstraint.activate([
            modelLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            modelLabel.topAnchor.constraint(equalTo: manufacturerTextField.bottomAnchor, constant: margin)
        ])

        NSLayoutConstraint.activate([
            modelTextField.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            modelTextField.topAnchor.constraint(equalTo: modelLabel.bottomAnchor, constant: spacing),
            modelTextField.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor)
        ])

        NSLayoutConstraint.activate([
            bodyLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            bodyLabel.topAnchor.constraint(equalTo: modelTextField.bottomAnchor, constant: margin)
        ])

        NSLayoutConstraint.activate([
            bodyTextField.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            bodyTextField.topAnchor.constraint(equalTo: bodyLabel.bottomAnchor, constant: spacing),
            bodyTextField.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor)
        ])

        NSLayoutConstraint.activate([
            yearOfIssueLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            yearOfIssueLabel.topAnchor.constraint(equalTo: bodyTextField.bottomAnchor, constant: margin)
        ])

        NSLayoutConstraint.activate([
            yearOfIssueTextField.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            yearOfIssueTextField.topAnchor.constraint(equalTo: yearOfIssueLabel.bottomAnchor, constant: spacing),
            yearOfIssueTextField.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor)
        ])

        NSLayoutConstraint.activate([
            carNumberLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            carNumberLabel.topAnchor.constraint(equalTo: yearOfIssueTextField.bottomAnchor, constant: margin)
        ])

        NSLayoutConstraint.activate([
            carNumberTextField.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            carNumberTextField.topAnchor.constraint(equalTo: carNumberLabel.bottomAnchor, constant: spacing),
            carNumberTextField.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor)
        ])
    }

    private func createBodyAccessoryView() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.translatesAutoresizingMaskIntoConstraints = false

        let doneAction = UIAction { [weak self] _ in
            guard let self else { return }
            if let row = lastSelectedRow {
                bodyTextField.text = bodyTypes[row]
            } else {
                bodyTextField.text = bodyTypes.first
            }
            bodyTextField.resignFirstResponder()
        }

        let doneButton = UIBarButtonItem(systemItem: .done, primaryAction: doneAction)

        toolbar.items = [doneButton]

        return toolbar
    }
}

// MARK: PickerView
extension CreateCarView: UIPickerViewDelegate, UIPickerViewDataSource {
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
        lastSelectedRow = row
    }

}

// MARK: Validate Input
extension CreateCarView {
    func isInputsValid() -> Bool {
        let requiredTextFields = [manufacturerTextField, bodyTextField, modelTextField]
        for textField in requiredTextFields {
            guard let text = textField.text, !text.isEmpty else {
                return false
            }

        }
        return true
    }

    func getCar() -> Car {
        let manufacturer = manufacturerTextField.text ?? ""
        let model = modelTextField.text ?? "model"
        let body = Body(rawValue: bodyTextField.text ?? "") ?? .sedan
        let year = Int(yearOfIssueTextField.text ?? "")
        let number = carNumberTextField.text

        return Car(
            manufacturer: manufacturer,
            model: model,
            body: body,
            yearOfIssue: year,
            carNumber: number
        )
    }
}
