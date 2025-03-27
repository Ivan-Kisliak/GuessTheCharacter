//
//  GamePresenter.swift
//  GuessTheCharacter
//
//  Created by  Ivan Kiskyak on 25.03.25.
//

import Foundation

// MARK: - Presenter Protocol
protocol IGamePresenter {
    func loadGame()
    func characterSelected(at index: Int)
}

// MARK: - Presenter
final class GamePresenter{
    private weak var view: IGameViewController?
    private let characterManager: ICharacterManager
    private var characters: [Character] = []
    private var characterAnswer: Character?
    private var score = 0
    
    init(view: IGameViewController, characterManager: ICharacterManager) {
        self.view = view
        self.characterManager = characterManager
    }
}

//MARK: - IGamePresenter
extension GamePresenter: IGamePresenter {
    func loadGame() {
        characters = characterManager.getRandomCharacters(count: 3)
        characterAnswer = characters.randomElement()
        view?.displayCharacters(characters, question: "\(characterAnswer?.name ?? "")")
    }
    
    func characterSelected(at index: Int) {
        let selectedCharacter = characters[index]
        let isCorrect = selectedCharacter.name == characterAnswer?.name
        score += isCorrect ? 1 : -1
        view?.showResult(isCorrect: isCorrect, score: score)
    }
}
