//
//  MainView.swift
//  AutomobileAccounting
//
//  Created by Евгений Борисов on 09.04.2024.
//

import UIKit

class CarsView: UIView {

    enum TableSection {
        case main
    }

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CarsTableViewCell.self, forCellReuseIdentifier: CarsTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.allowsSelection = false
        return tableView
    }()

    private var tableViewDataSource: UITableViewDiffableDataSource<TableSection, Car>?

    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: Setup UI
 private extension CarsView {
    func setupUI() {
        backgroundColor = .white
        self.addSubviews()
        self.setupLayout()
        self.setupDatasource()

    }

    func addSubviews() {
        let views = [tableView]

        for view in views {
            addSubview(view)
        }
    }

    func setupLayout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: TableView Datasource
extension CarsView {
    private func setupDatasource() {
        tableViewDataSource = UITableViewDiffableDataSource(tableView: tableView) { tableView, indexPath, car in
            let cell = tableView.dequeueReusableCell(
                withIdentifier: CarsTableViewCell.identifier, for: indexPath
            ) as? CarsTableViewCell
            cell?.setupCell(with: car)
            return cell
        }
    }

    func updateTableDatasource(with cars: [Car], animated: Bool) {
        guard let tableViewDataSource else { return }
        var snapshot = NSDiffableDataSourceSnapshot<TableSection, Car>()
        snapshot.appendSections([.main])
        snapshot.appendItems(cars, toSection: .main)
        tableViewDataSource.apply(snapshot, animatingDifferences: animated)
    }
}

