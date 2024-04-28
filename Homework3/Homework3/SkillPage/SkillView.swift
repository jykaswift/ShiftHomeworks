//
//  SkillView.swift
//  Homework3
//
//  Created by Евгений Борисов on 27.04.2024.
//

import UIKit

protocol SkillViewDelegate: AnyObject {
    func getLanguageDescription(withIndex index: Int) -> String?
    func saveLanguageDescription(withIndex index: Int, andDescription description: String?)
}

class SkillView: UIView {

    weak var delegate: SkillViewDelegate?

    private lazy var languageSegmentedControl: UISegmentedControl = {
        let languageSegmentedControl = UISegmentedControl()
        languageSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        languageSegmentedControl.addAction(selectedLanguageAction, for: .valueChanged)
        return languageSegmentedControl
    }()

    private lazy var selectedLanguageAction = UIAction { [weak self] _ in
        guard let self else { return }
        let selectedLanguageIndex = languageSegmentedControl.selectedSegmentIndex
        descriptionTextView.text = delegate?.getLanguageDescription(withIndex: selectedLanguageIndex)
    }

    private lazy var noDataLabel: UILabel = {
        let noDataLabel = UILabel()
        noDataLabel.translatesAutoresizingMaskIntoConstraints = false
        noDataLabel.font = UIFont.systemFont(ofSize: 150, weight: .bold)
        noDataLabel.adjustsFontSizeToFitWidth = true
        noDataLabel.isHidden = true
        noDataLabel.text = "Нет доступной информации"

        return noDataLabel
    }()

    private lazy var descriptionTextView: UITextView = {
        let descriptionTextView = UITextView()
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.layer.borderWidth = 2
        descriptionTextView.layer.borderColor = UIColor.lightGray.cgColor
        descriptionTextView.layer.cornerRadius = 10
        descriptionTextView.inputAccessoryView = keyboardToolBar
        descriptionTextView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

        return descriptionTextView
    }()

    private lazy var keyboardToolBar: UIToolbar = {
        var screenWidth = UIScreen.current?.bounds.width ?? 100

        let keyboardToolBar = UIToolbar(frame: CGRect(x: 0,y: 0,width: screenWidth,height: 35))

        let doneButton = UIBarButtonItem(systemItem: .close, primaryAction: closeButtonAction)
        let saveButton = UIBarButtonItem(systemItem: .save, primaryAction: saveButtonAction)
        let space = UIBarButtonItem(systemItem: .flexibleSpace)

        keyboardToolBar.items = [doneButton, space, saveButton]
        keyboardToolBar.sizeToFit()

        return keyboardToolBar
    }()

    private lazy var closeButtonAction = UIAction { [weak self] _ in
        guard let self else { return }
        descriptionTextView.resignFirstResponder()
    }

    private lazy var saveButtonAction = UIAction {[weak self] _ in
        guard let self else { return }
        let selectedLanguageIndex = languageSegmentedControl.selectedSegmentIndex
        let description = descriptionTextView.text
        delegate?.saveLanguageDescription(withIndex: selectedLanguageIndex, andDescription: description)
        descriptionTextView.resignFirstResponder()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


// MARK: UI Configuration
private extension SkillView {

    func setupView() {
        backgroundColor = .white
        addSubviews()
        setupLayout()
    }

    func addSubviews() {
        addSubview(languageSegmentedControl)
        addSubview(descriptionTextView)
        addSubview(noDataLabel)
    }

    func setupLayout() {
        directionalLayoutMargins = NSDirectionalEdgeInsets(
            top: 10, 
            leading: 10,
            bottom: 10,
            trailing: 10
        )

        NSLayoutConstraint.activate([
            languageSegmentedControl.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            languageSegmentedControl.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            languageSegmentedControl.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),

            descriptionTextView.topAnchor.constraint(equalTo: languageSegmentedControl.bottomAnchor, constant: 10),
            descriptionTextView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            descriptionTextView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            descriptionTextView.heightAnchor.constraint(equalToConstant: 300),

            noDataLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            noDataLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            noDataLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
        ])
    }
}


// MARK: Setup Data
extension SkillView {
    func setupData(with languages: [ProgrammingLanguage]) {
        guard !languages.isEmpty else {
            showNoDataLabel()
            return
        }

        setupLanguages(languages)
    }

    private func showNoDataLabel() {
        noDataLabel.isHidden = false
        descriptionTextView.isHidden = true
        languageSegmentedControl.isHidden = true
    }

    private func setupLanguages(_ languages: [ProgrammingLanguage]) {
        for (index, language) in languages.enumerated() {
            languageSegmentedControl.insertSegment(
                withTitle: language.name,
                at: index,
                animated: false
            )
        }

        descriptionTextView.text = languages[0].description
        languageSegmentedControl.selectedSegmentIndex = 0
    }
}
