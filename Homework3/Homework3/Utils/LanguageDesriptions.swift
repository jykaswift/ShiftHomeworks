//
//  LanguageDesriptions.swift
//  Homework3
//
//  Created by Евгений Борисов on 27.04.2024.
//

import Foundation

enum LanguageDesriptions: String, CaseIterable {

    case kotlin = "Kotlin"

    case python = "Python"

    case javasript = "Javascript"

    case swift = "Swift"

    var description: String {
        switch self {
        case .kotlin: 
            """
            Это был первый язык, который я изучал, за иключением паскаля :)

            На этом языке я писал следующие приложения:
            Различные консольные приложения по работе с файлами
            Настольное приложение с UI игры морской бой с ботами различного уровня сложности
            Несколько маленьких android приложений
            """
        case .javasript:
            """
            Писал фронт и бэк сайта normastroy.ru на данном языке
            Не очень фанат js, так как не очень фанат языков с динамической типизацией
            """
        case .python:
            """
            Для чего я использовал этот язык:
            Если нужно было написать небольшое приложение
            Боты в телеграме
            Боты в дискорде
            """
        case .swift:
            """
            В данный момент изучаю swift на протяжении нескольких месяцев и очень нраица)
            Очень удобный и приятный для написания язык
            """
        }
    }

}
