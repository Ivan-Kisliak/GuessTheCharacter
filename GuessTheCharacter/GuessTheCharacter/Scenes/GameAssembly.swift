//
//  GameAssembly.swift
//  GuessTheCharacter
//
//  Created by  Ivan Kiskyak on 25.03.25.
//

import UIKit

final class GameAssembly {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
}

extension GameAssembly: BaseAssembly {
    func configure(viewController: UIViewController) {
        guard let gameVC = viewController as? GameViewController else { return }
        let presenter = GamePresenter()
        gameVC.presenter = presenter
        presenter.view = gameVC
    }
}
