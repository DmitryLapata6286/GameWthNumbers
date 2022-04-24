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
    
    lazy var game = Game(countItems: digitButtons.count)
    
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
        sender.isHidden = true
        print(sender.tag)
    }
    // MARK: - Methods
    
    func setupGameScreen(){
        for i in game.items.indices {
            digitButtons[i].setTitle(game.items[i].title, for: .normal)
            digitButtons[i].isHidden = false
        }
        rightDigit.text = game.rightItem?.title
    }
    
    func updateGameScreen(){
        for i in game.items.indices {
            digitButtons[i].isHidden = game.items[i].isFound
        }
        rightDigit.text = game.rightItem?.title
        if game.status == .winner{
            gameStatus.text = "You are winner!!"
            gameStatus.textColor = .green
            
        }
    }

    

}
