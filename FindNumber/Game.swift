//
//  Game.swift
//  FindNumber
//
//  Created by Dmitry Lapata on 24.04.22.
//

import Foundation
import UIKit

enum GameStatus {
    case start
    case winner
    case loser
}

class Game {
    
    struct Item {
        var title: String
        var isFound: Bool = false
        var isWrong: Bool = false
    }
    
    private let data: [Int] = Array(1...99)
    
    var items: [Item] = []
    var rightItem:Item?
    var status:GameStatus = .start{
        didSet{
            if status != .start {
                endGame()
            }
        }
    }
    
    private var countItems: Int
    private var secondsGame: Int {
        didSet{
            if secondsGame == 0 {
                status = .loser
                
            }
            updateTimer(status, secondsGame)
        }
    }
    private var timer: Timer?
    
    private var updateTimer:(GameStatus, Int)->()
    
    init(countItems: Int, updateTimer: @escaping (_ status:GameStatus, _ secs: Int) -> ()){
        self.countItems = countItems
        self.secondsGame = Settings.shared.currentSettings.gameDuration
        self.updateTimer = updateTimer
        setupGame()
    }
    
    func setupGame() {
        var digits = data.shuffled()
        items.removeAll()
        while items.count < countItems {
            let item = Item(title: String(digits.removeFirst()))
            items.append(item)
        }
        rightItem = items.shuffled().first
        updateTimer(status, secondsGame)
        
        
        if Settings.shared.currentSettings.timerState{
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {[weak self] (_) in
                self?.secondsGame -= 1
                
            })
        }
    }
    func check(_ i:Int){
        guard status == .start else {return}
        
        if items[i].title == rightItem?.title{
            items[i].isFound = true
            rightItem = items.shuffled().first(where: {(item) -> Bool in
                item.isFound == false
            })
        }else{
            items[i].isWrong = true
        }
        if rightItem == nil {
            status = .winner
        }
    }
    func endGame() {
        timer?.invalidate()
    }
    
    func newGame(){
        status = .start
        
        setupGame()
    }
}

//MARK: - Extensions

extension Int{
    func secondsToTimeString()->String{
        let minutes = self / 60
        let seconds = self % 60
        
        return String(format: "%d:%02d", minutes, seconds)
    }
}
