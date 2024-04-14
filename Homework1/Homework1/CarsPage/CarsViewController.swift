//
//  ViewController.swift
//  AutomobileAccounting
//
//  Created by Евгений Борисов on 09.04.2024.
//

import UIKit

class CarsViewController: UIViewController {

    private lazy var carsView = CarsView()
    private lazy var carDatasource = CarDatasource()

    override func loadView() {
        view = carsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupNavigationBar()
    }

    private func setupView() {
        carsView.updateTableDatasource(with: carDatasource.datasource, animated: true)
    }

}

// MARK: Navigation bar
private extension CarsViewController {
    func setupNavigationBar() {

        let sortMenu = self.createSortMenu()
        let sortButton = UIBarButtonItem(title: "Сортировка", menu: sortMenu)
        navigationItem.leftBarButtonItem = sortButton

        let createCarButton = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(showCreateCarController)
        )
        navigationItem.rightBarButtonItem = createCarButton
    }

    @objc func showCreateCarController() {
        let createCarController = CreateCarViewController()
        createCarController.delegate = self
        navigationController?.pushViewController(createCarController, animated: true)
    }

    func createSortMenu() -> UIMenu {
        var menuItems: [UIAction] = []
        let allAction = self.createSortActionWith(title: "Все", state: .on)

        menuItems.append(allAction)

        for body in Body.allCases {
            let action = self.createSortActionWith(title: body.rawValue, state: .off, sortType: body)
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
            carDatasource.setSortedState(with: sortType)
            carsView.updateTableDatasource(with: carDatasource.getSortedDatasource(), animated: true)
            self.navigationItem.leftBarButtonItem?.title = title
        }

        return action
    }
}

extension CarsViewController: CreateCarDelegate {
    func saveCar(car: Car) {
        carDatasource.addCar(car: car)
        carsView.updateTableDatasource(with: carDatasource.getSortedDatasource(), animated: false)
    }
}
