//
//  GameViewController.swift
//  FindNumber
//
//  Created by Dmitry Lapata on 24.04.22.
//

import UIKit

class GameViewController: UIViewController {
    
    // MARK: - Outlets    
    @IBOutlet var digitButtons: [UIButton]!
    @IBOutlet weak var rightDigit: UILabel!
    @IBOutlet weak var gameStatus: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var newGame: UIButton!
    
    lazy var game = Game(countItems: digitButtons.count, gameTime: 40) {[weak self] (status, gameTime) in
        guard let self = self else {return}
        self.timerLabel.text = gameTime.secondsToTimeString()
        self.updateGameInfo(with: status)
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupGameScreen()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions

    @IBAction func pressButton(_ sender: UIButton) {
        guard let buttonIndex = digitButtons.firstIndex(of: sender) else {return}
        game.check(buttonIndex)
        updateGameScreen()
    }
    @IBAction func newGameButton(_ sender: Any) {
    }
    
    
    // MARK: - Methods
    
    private func setupGameScreen(){
        for i in game.items.indices {
            digitButtons[i].setTitle(game.items[i].title, for: .normal)
            digitButtons[i].isHidden = false
        }
        rightDigit.text = game.rightItem?.title
    }
    
    private func updateGameScreen(){
        for i in game.items.indices {
            digitButtons[i].isHidden = game.items[i].isFound
            if game.items[i].isWrong {
                UIView.animate(withDuration: 0.4){ [weak self] in
                    self?.digitButtons[i].backgroundColor = .red
                } completion: {[weak self] (_) in
                    self?.digitButtons[i].backgroundColor = UIColor.init(named: "customColor")
                    self?.game.items[i].isWrong = false
                }
            }
        }
        rightDigit.text = game.rightItem?.title
        updateGameInfo(with: game.status)
    }
    
    
    private func updateGameInfo(with status:GameStatus){
        switch status {
        case .start:
            gameStatus.text = "Game is started"
            gameStatus.textColor = .black

        case .winner:
            gameStatus.text = "You are winner!!"
            gameStatus.textColor = .green

        case .loser:
            gameStatus.text = "You are lose!!"
            gameStatus.textColor = .red

        }
    }
    

}
