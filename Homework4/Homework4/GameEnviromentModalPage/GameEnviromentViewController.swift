//
//  GameEnviromentViewController.swift
//  Homework4
//
//  Created by Евгений Борисов on 07.05.2024.
//

import UIKit

class GameEnviromentViewController: UIViewController {

    private lazy var gameEnviromentView = GameEnviromentView()
    private var gameEnviroment: GameEnviroment

    init(gameEnviroment: GameEnviroment) {
        self.gameEnviroment = gameEnviroment
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = gameEnviromentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        gameEnviromentView.setupGameEnviroment(gameEnviroment)
    }

}
