//
//  SkillReviewController.swift
//  Homework3
//
//  Created by Евгений Борисов on 26.04.2024.
//

import UIKit

class SkillsController: UIViewController {

    private lazy var skillView: SkillView = {
        let skillView = SkillView()
        skillView.delegate = self
        return skillView
    }()
    
    private var dataSource = DataSource.shared

    override func loadView() {
        view = skillView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        skillView.setupData(with: dataSource.user.programmingLanguages)
    }

}

extension SkillsController: SkillViewDelegate {
    func saveLanguageDescription(withIndex index: Int, andDescription description: String?) {
        dataSource.saveLanguageDescription(withIndex: index, andDescription: description)
    }
    
    func getLanguageDescription(withIndex index: Int) -> String? {
        dataSource.user.programmingLanguages[index].description
    }
}
