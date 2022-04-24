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
    }
    
    private let data: [Int] = Array(1...99)
    
    var items: [Item] = []
    var rightItem:Item?
    var status:GameStatus = .start
    
    private var countItems: Int
    
    init(countItems: Int){
        self.countItems = countItems
        setupGame()
    }
    
    func setupGame() {
        var digits = data.shuffled()
        while items.count < countItems {
            let item = Item(title: String(digits.removeFirst()))
            items.append(item)
        }
        rightItem = items.shuffled().first
    }
    func check(_ i:Int){
        if items[i].title == rightItem?.title{
            items[i].isFound = true
            rightItem = items.shuffled().first(where: {(item) -> Bool in
                item.isFound == false
            })
        }
        if rightItem == nil {
            status = .winner
        }
    }
}
