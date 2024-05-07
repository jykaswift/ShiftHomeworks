//
//  GameInfoViewController.swift
//  Homework4
//
//  Created by Евгений Борисов on 07.05.2024.
//

import UIKit

class GameInfoViewController: UIViewController {
    
    private lazy var gameInfoView = GameInfoView()

    override func loadView() {
        view = gameInfoView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
