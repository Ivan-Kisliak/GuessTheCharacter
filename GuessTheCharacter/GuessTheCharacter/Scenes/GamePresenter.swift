//
//  GamePresenter.swift
//  GuessTheCharacter
//
//  Created by  Ivan Kiskyak on 25.03.25.
//

import Foundation

protocol IGamePresenter {
    
}

final class GamePresenter {
    weak var view: IGameViewController? 
    
}

extension GamePresenter: IGamePresenter {
    
}
