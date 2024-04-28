//
//  HobbiesController.swift
//  Homework3
//
//  Created by Евгений Борисов on 27.04.2024.
//

import UIKit

class HobbiesController: UIViewController {

    private lazy var hobbiesView: HobbiesView = HobbiesView(delegate: self)

    private var dataSource = DataSource.shared

    override func loadView() {
        view = hobbiesView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        hobbiesView.setupData(with: dataSource.user.hobbies)
    }
}

extension HobbiesController: HobbiesViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        hobbiesView.pageControl.currentPage = Int(pageNumber)
    }
}
