//
//  GameInfoViewController.swift
//  Homework4
//
//  Created by Евгений Борисов on 07.05.2024.
//

import UIKit

protocol GameInfoViewProtocol: AnyObject { 
    func set(model: GameInfoViewData)
}

class GameInfoViewController: UIViewController {
    lazy var gameInfoView = GameInfoView()
    var presenter: GameInfoPresenterProtocol

    init(presenter: GameInfoPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = gameInfoView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionViewDelegates()
        presenter.didLoad(ui: self)
    }
}

// MARK: GameInfoViewProtocol
extension GameInfoViewController: GameInfoViewProtocol { 
    func set(model: GameInfoViewData) {
        self.title = model.gameName
    }
}
