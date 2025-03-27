//
//  GameAssembly.swift
//  GuessTheCharacter
//
//  Created by  Ivan Kiskyak on 25.03.25.
//

import UIKit

protocol IBaseAssembly {
    func configure(viewController: UIViewController)
}


final class GameAssembly {
    private let navigationController: UINavigationController
    private let characterManager: ICharacterManager
    
    init(navigationController: UINavigationController, characterManager: ICharacterManager) {
        self.navigationController = navigationController
        self.characterManager = characterManager
    }
}

//MARK: - IBaseAssembly
extension GameAssembly: IBaseAssembly {
    func configure(viewController: UIViewController) {
        guard let gameVC = viewController as? GameViewController else { return }
        let presenter = GamePresenter(view: gameVC, characterManager: characterManager)
        
        gameVC.presenter = presenter
    }
}
