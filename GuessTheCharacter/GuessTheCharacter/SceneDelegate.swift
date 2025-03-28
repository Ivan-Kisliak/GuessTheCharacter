//
//  SceneDelegate.swift
//  GuessTheCharacter
//
//  Created by  Ivan Kiskyak on 24.03.25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let characterManager = CharacterManager()
        let gameVC = GameViewController()
        let navigationController = UINavigationController(rootViewController: gameVC)
        
        let gameAssembly = GameAssembly(navigationController: navigationController,
                                        characterManager: characterManager)
        gameAssembly.configure(viewController: gameVC)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
    }
}

