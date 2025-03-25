//
//  CharacterManager.swift
//  GuessTheCharacter
//
//  Created by  Ivan Kiskyak on 25.03.25.
//

import UIKit

import UIKit

protocol ICharacterManager {
    func getRandomCharacters(count: Int) -> [Character]
}

class CharacterManager {
    private let characters: [Character] = [
        Character(name: "Кот Матроскин", image: "Cat"),
        Character(name: "Дядя Фёдор", image: "Fedor"),
        Character(name: "Крокодил Гена", image: "Gena"),
        Character(name: "Шарик", image: "Dog"),
        Character(name: "Винни-Пух", image: "ViniPuh"),
        Character(name: "Чебурашка", image: "Cheburashka"),
        Character(name: "Пяточок", image: "Pig")
    ]

}

extension CharacterManager: ICharacterManager {
    func getRandomCharacters(count: Int) -> [Character] {
        Array(characters.shuffled().prefix(count))
    }
}



