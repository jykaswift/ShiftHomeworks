//
//  DataSource.swift
//  Homework4
//
//  Created by Евгений Борисов on 07.05.2024.
//

import Foundation
import UIKit
class DataSource {
    
    static let shared = DataSource()
    
    private init() {}

    let dataSource: [Game] = MockData.getMockData()

    subscript(_ index: Int) -> Game {
        dataSource[index]
    }

    var count: Int {
        dataSource.count
    }

}
