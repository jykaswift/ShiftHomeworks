//
//  ViewController.swift
//  AutomobileAccounting
//
//  Created by Евгений Борисов on 09.04.2024.
//

import UIKit

class CarsViewController: UIViewController {

    private lazy var carsView = CarsView()
    private lazy var datasource = CarDatasource()

    override func loadView() {
        view = carsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavigationBar()
    }

    private func setupView() {
        carsView.updateTableDatasource(with: datasource.getDatasource())
    }

}

// MARK: Navigation bar
extension CarsViewController {
    private func setupNavigationBar() {

        let menu = createSortMenu()

        let barItem = UIBarButtonItem(title: "Сортировка", menu: menu)
        navigationItem.leftBarButtonItem = barItem
    }

    private func createSortMenu() -> UIMenu {
        var menuItems: [UIAction] = []

        let allCase = UIAction(title: "Все", state: .on) { [weak carsView, weak datasource, weak self] (_) in
            guard let carsView, let datasource, let self else { return }
            carsView.updateTableDatasource(with: datasource.getDatasource())
            self.navigationItem.leftBarButtonItem?.title = "Сортировка"
        }

        menuItems.append(allCase)

        for body in Body.allCases {
            let action = UIAction(title: body.rawValue) { [weak carsView, weak datasource, weak self] (_) in
                guard let carsView, let datasource, let self else { return }
                carsView.updateTableDatasource(with: datasource.getSortedDatasource(with: body))
                self.navigationItem.leftBarButtonItem?.title = body.rawValue
            }
            menuItems.append(action)
        }

        let menu = UIMenu(options: .singleSelection, children: menuItems)
        return menu
    }
}

