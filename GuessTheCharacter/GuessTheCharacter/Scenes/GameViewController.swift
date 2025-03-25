//
//  ViewController.swift
//  GuessTheCharacter
//
//  Created by  Ivan Kiskyak on 24.03.25.
//

import UIKit

protocol IGameViewController: AnyObject {
    
}

class GameViewController: UIViewController {
    
    var presenter: IGamePresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

}

extension GameViewController: IGameViewController {
    
}

