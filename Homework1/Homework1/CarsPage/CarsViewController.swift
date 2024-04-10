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
        carsView.updateTableDatasource(with: datasource.getDatasource(), animated: true)
    }

}

// MARK: Navigation bar
extension CarsViewController {
    private func setupNavigationBar() {

        let sortMenu = createSortMenu()
        let sortButton = UIBarButtonItem(title: "Сортировка", menu: sortMenu)
        navigationItem.leftBarButtonItem = sortButton

        let createCarButton = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(showCreateCarController)
        )
        navigationItem.rightBarButtonItem = createCarButton
    }

    @objc private func showCreateCarController() {
        let createCarController = CreateCarViewController()
        createCarController.delegate = self
        navigationController?.pushViewController(createCarController, animated: true)
    }

    private func createSortMenu() -> UIMenu {
        var menuItems: [UIAction] = []
        let allAction = createSortActionWith(title: "Все", state: .on)

        menuItems.append(allAction)

        for body in Body.allCases {
            let action = createSortActionWith(title: body.rawValue, state: .off, sortType: body)
            menuItems.append(action)
        }

        let menu = UIMenu(options: .singleSelection, children: menuItems)
        return menu
    }

    private func createSortActionWith(
        title: String,
        state: UIMenuElement.State,
        sortType: Body? = nil
    ) -> UIAction {
        let action = UIAction(title: title, state: state) { [weak self] _ in
            guard let self else { return }
            datasource.setSortedState(with: sortType)
            carsView.updateTableDatasource(with: datasource.getSortedDatasource(), animated: true)
            self.navigationItem.leftBarButtonItem?.title = title
        }

        return action
    }
}

extension CarsViewController: CreateCarDelegate {
    func saveCar(car: Car) {
        datasource.addCar(car: car)
        carsView.updateTableDatasource(with: datasource.getSortedDatasource(), animated: false)
    }
}
