//
//  ViewController.swift
//  GuessTheCharacter
//
//  Created by  Ivan Kiskyak on 24.03.25.
//

import UIKit

protocol IGameViewController: AnyObject {
    func displayCharacters(_ characters: [Character], question: String)
    func showResult(isCorrect: Bool, score: Int)
}

final class GameViewController: UIViewController {
    var presenter: IGamePresenter?
    
    private let titleLabel = UILabel()
    private let characterOneButton = UIButton()
    private let characterTwoButton = UIButton()
    private let characterThreeButton = UIButton()
    private let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
    }
}

//MARK: - Setup View
private extension GameViewController {
    func setupView() {
        view.backgroundColor = .white
        
        presenter?.loadGame()
        
        setupStackView()
        setupTitleLabel()
        setupCharacterButtons()
        
        view.addSubview(stackView)
    }
    
    func setupTitleLabel() {
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    func setupCharacterButton(_ button: UIButton, tag: Int) {
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        button.tag = tag
    }
    
    @objc
    func buttonTapped(_ sender: UIButton) {
        presenter?.characterSelected(at: sender.tag)
    }
    
    func provideCharactrerButtons() -> [UIButton] {
        [characterOneButton, characterTwoButton, characterThreeButton]
    }
    
    func setupCharacterButtons() {
        provideCharactrerButtons().enumerated().forEach {
            setupCharacterButton($1, tag: $0)
        }
    }
    
    func setupStackView() {
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.addArrangedSubview(titleLabel)
        provideCharactrerButtons().forEach {
            stackView.addArrangedSubview($0)
        }
    }
}

//MARK: - Setup Layout
private extension GameViewController {
    func setupLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        provideCharactrerButtons().forEach {
            NSLayoutConstraint.activate([
                $0.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.45),
                $0.heightAnchor.constraint(equalTo: $0.widthAnchor)
            ])
        }
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}

//MARK: - IGameViewController
extension GameViewController: IGameViewController {
    func displayCharacters(_ characters: [Character], question: String) {
        titleLabel.text = "Кто это: \(question)?"
        characters.enumerated().forEach {
            if let imageName = $1.image {
                provideCharactrerButtons()[$0].setImage(UIImage(named: imageName), for: .normal)
            }
        }
    }
    
    func showResult(isCorrect: Bool, score: Int) {
        let alert = UIAlertController(title: isCorrect ? "Верно!" : "Неправильно",
                                      message: "Счёт: \(score)",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Продолжить", style: .default) { [weak self] _ in
            self?.presenter?.loadGame()
        })
        present(alert, animated: true)
    }
}


