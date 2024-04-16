//
//  CreateCarView.swift
//  AutomobileAccounting
//
//  Created by Евгений Борисов on 09.04.2024.
//

import UIKit

protocol CreateCarViewDelegate: AnyObject, UIPickerViewDelegate, UIPickerViewDataSource {
    var lastSelectedPickerRow: Int? { get }
    var bodyTypes: [String] { get }
}

class CreateCarView: UIView {
    weak var delegate: CreateCarViewDelegate?

    private lazy var manufacturerLabel: UILabel = {
        let manufacturerLabel = UILabel()
        manufacturerLabel.translatesAutoresizingMaskIntoConstraints = false
        manufacturerLabel.font = UIFont.systemFont(ofSize: 16)
        manufacturerLabel.text = "Введите марку машины \u{002A}"
        return manufacturerLabel
    }()

    lazy var manufacturerTextField: UITextField = {
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

    lazy var modelTextField: UITextField = {
        let modelTextField = UITextField()
        modelTextField.translatesAutoresizingMaskIntoConstraints = false
        modelTextField.placeholder = "Модель..."
        modelTextField.borderStyle = .roundedRect
        return modelTextField
    }()

    private lazy var bodyPickerView: UIPickerView = {
        let bodyPickerView = UIPickerView()
        bodyPickerView.delegate = self.delegate
        return bodyPickerView
    }()

    private lazy var bodyLabel: UILabel = {
        let modelLabel = UILabel()
        modelLabel.translatesAutoresizingMaskIntoConstraints = false
        modelLabel.font = UIFont.systemFont(ofSize: 16)
        modelLabel.text = "Выберите кузов машины \u{002A}"
        return modelLabel
    }()

    lazy var bodyTextField: UITextField = {
        let bodyTextField = UITextField()
        bodyTextField.translatesAutoresizingMaskIntoConstraints = false
        bodyTextField.placeholder = "Кузов..."
        bodyTextField.inputView = bodyPickerView
        bodyTextField.borderStyle = .roundedRect
        bodyTextField.inputAccessoryView = self.bodyAccessoryView
        return bodyTextField
    }()

    private lazy var bodyAccessoryView: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.translatesAutoresizingMaskIntoConstraints = false

        let doneAction = UIAction { [weak self] _ in
            guard let self else { return }
            if let row = delegate?.lastSelectedPickerRow {
                bodyTextField.text = delegate?.bodyTypes[row]
            } else {
                bodyTextField.text = delegate?.bodyTypes.first
            }
            bodyTextField.resignFirstResponder()
        }

        let doneButton = UIBarButtonItem(systemItem: .done, primaryAction: doneAction)

        toolbar.items = [doneButton]

        return toolbar
    }()

    private lazy var yearOfIssueLabel: UILabel = {
        let yearOfIssueLabel = UILabel()
        yearOfIssueLabel.translatesAutoresizingMaskIntoConstraints = false
        yearOfIssueLabel.font = UIFont.systemFont(ofSize: 16)
        yearOfIssueLabel.text = "Введите год выпуска машины"
        return yearOfIssueLabel
    }()

    lazy var yearOfIssueTextField: UITextField = {
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

    lazy var carNumberTextField: UITextField = {
        let carNumberTextField = UITextField()
        carNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        carNumberTextField.placeholder = "Государственный номер..."
        carNumberTextField.borderStyle = .roundedRect
        return carNumberTextField
    }()

    init(delegage: CreateCarViewDelegate) {
        super.init(frame: .zero)
        self.delegate = delegage
        self.setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Setup UI
private extension CreateCarView {
    func setupUI() {
        backgroundColor = .white
        self.addSubviews()
        self.setupLayout()
    }

    func addSubviews() {
        addSubview(manufacturerLabel)
        addSubview(manufacturerTextField)
        addSubview(modelLabel)
        addSubview(modelTextField)
        addSubview(bodyLabel)
        addSubview(bodyTextField)
        addSubview(yearOfIssueLabel)
        addSubview(yearOfIssueTextField)
        addSubview(carNumberLabel)
        addSubview(carNumberTextField)
    }

    func setupLayout() {
        directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        let spacing: CGFloat = 5
        let margin: CGFloat = 10

        NSLayoutConstraint.activate([
            manufacturerLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            manufacturerLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),

            manufacturerTextField.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            manufacturerTextField.topAnchor.constraint(equalTo: manufacturerLabel.bottomAnchor, constant: spacing),
            manufacturerTextField.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),

            modelLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            modelLabel.topAnchor.constraint(equalTo: manufacturerTextField.bottomAnchor, constant: margin),

            modelTextField.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            modelTextField.topAnchor.constraint(equalTo: modelLabel.bottomAnchor, constant: spacing),
            modelTextField.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),

            bodyLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            bodyLabel.topAnchor.constraint(equalTo: modelTextField.bottomAnchor, constant: margin),

            bodyTextField.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            bodyTextField.topAnchor.constraint(equalTo: bodyLabel.bottomAnchor, constant: spacing),
            bodyTextField.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),

            yearOfIssueLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            yearOfIssueLabel.topAnchor.constraint(equalTo: bodyTextField.bottomAnchor, constant: margin),

            yearOfIssueTextField.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            yearOfIssueTextField.topAnchor.constraint(equalTo: yearOfIssueLabel.bottomAnchor, constant: spacing),
            yearOfIssueTextField.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),

            carNumberLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            carNumberLabel.topAnchor.constraint(equalTo: yearOfIssueTextField.bottomAnchor, constant: margin),

            carNumberTextField.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            carNumberTextField.topAnchor.constraint(equalTo: carNumberLabel.bottomAnchor, constant: spacing),
            carNumberTextField.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor)
        ])
    }

}
