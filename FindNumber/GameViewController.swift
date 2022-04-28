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
    
    lazy var game = Game(countItems: digitButtons.count) {[weak self] (status, gameTime) in
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
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        game.endGame()
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
            //digitButtons[i].isHidden = game.items[i].isFound          //Not hidden, just opacity
            digitButtons[i].alpha = game.items[i].isFound ? 0 : 1
            digitButtons[i].isEnabled = !game.items[i].isFound

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
            if game.isNewRecord {
                showAlertRecord()
            }else{
                showAlert()
            }
        case .loser:
            gameStatus.text = "You are lose!!"
            gameStatus.textColor = .red
            showAlert()
        }
    }
    private func showAlertRecord(){
        let alert = UIAlertController(title: "Condratulations!", message: "New Record!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        // for iPad
        if let popover = alert.popoverPresentationController {
            popover.sourceView = self.view
            popover.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            popover.permittedArrowDirections = UIPopoverArrowDirection.init(rawValue: 0)
        }
        present(alert, animated: true, completion: nil)
    }
    private func showAlert(){
        let alert = UIAlertController(title: "Do u wanna play again?", message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Yeah!", style: .default){[weak self](_) in
            self?.game.newGame()
            self?.setupGameScreen()
        })
        alert.addAction(UIAlertAction(title: "Show record!", style: .default){[weak self] (_) in
            // TODO: - recordVC
        })
        alert.addAction(UIAlertAction(title: "Nope.", style: .destructive){[weak self](_) in
            self?.navigationController?.popViewController(animated: true)
        })
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        // for iPad
        if let popover = alert.popoverPresentationController {
            popover.sourceView = self.view
            popover.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            popover.permittedArrowDirections = UIPopoverArrowDirection.init(rawValue: 0)
        }
        
        present(alert, animated: true)
    }

}
