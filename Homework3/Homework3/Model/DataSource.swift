//
//  DataSource.swift
//  Homework3
//
//  Created by Евгений Борисов on 27.04.2024.
//

import Foundation
import UIKit

class DataSource {
    
    static let shared = DataSource()

    private let userCommonInfo = UserCommonInfo(
        avatar: UIImage(named: "avatar"),
        name: "Евгений",
        secondName: "Борисов",
        residenceСity: "Санкт-Петербург",
        birthCity: "Владикавказ",
        isMarried: false
    )

    private lazy var userLanguages: [ProgrammingLanguage] = {
        return LanguageDesriptions.allCases.map { language in
            ProgrammingLanguage(name: language.rawValue, description: language.desription)
        }
    }()

    private let hobbies = [
        Hobby(
            name: "Лыжи",
            image: UIImage(named: "skiing"),
            description: """
            Катаюсь на лыжах с самого детства
            Был на большом количестве различных курортов, в сочи, приэльбрусье и много где еще
            """
        ),
        Hobby(
            name: "Гитара",
            image: UIImage(named: "guitar"),
            description: """
            Люблю в свободное время поирать на гитаре
            Игра на гитаре помогает абстрагироваться от мира и позалипать в мысли :)
            """
        ),
        Hobby(name: "Ведьмак 3", description: "Просто любимая игра)")
    ]

    private(set) lazy var user = User(
        userCommonInfo: userCommonInfo, 
        programmingLanguages: userLanguages,
        hobbies: hobbies
    )

    private init() { }

    func saveLanguageDescription(withIndex index: Int, andDescription description: String?) {
        user.programmingLanguages[index].description = description
    }

}
