//
//  GameRouter.swift
//  GuessTheCharacter
//
//  Created by  Ivan Kiskyak on 28.03.25.
//

import UIKit

protocol IGameRouterDelegate: AnyObject {
    func didDismissAlert()
}

protocol IGameRouter: AnyObject {
    func showResult(isCorrect: Bool, score: Int)
}

final class GameRouter {
    private weak var viewController: UIViewController?
    weak var delegate: IGameRouterDelegate?

    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

// MARK: - IGameRouter
extension GameRouter: IGameRouter {
    func showResult(isCorrect: Bool, score: Int) {
        let alert = UIAlertController(title: isCorrect ? "Верно!" : "Неправильно",
                                      message: "Счёт: \(score)",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Продолжить", style: .default) { [weak self] _ in
            self?.delegate?.didDismissAlert() 
        })
        viewController?.present(alert, animated: true)
    }
}



