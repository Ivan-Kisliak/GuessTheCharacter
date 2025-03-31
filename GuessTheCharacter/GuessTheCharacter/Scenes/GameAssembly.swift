//
//  GameAssembly.swift
//  GuessTheCharacter
//
//  Created by  Ivan Kiskyak on 25.03.25.
//

import UIKit

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
        let router = GameRouter(viewController: gameVC)
        let presenter = GamePresenter(view: gameVC,
                                      characterManager: characterManager,
                                      router: router)
        
        router.delegate = presenter
        gameVC.presenter = presenter
    }
}



