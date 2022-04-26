//
//  Settings.swift
//  FindNumber
//
//  Created by Dmitry Lapata on 26.04.22.
//

import Foundation

enum KeysUserDefaults{
    static let settingsGame = "settingsGame"
}

struct GameSettings: Codable {
    var timerState: Bool
    var gameDuration: Int
}

class Settings {
    static var shared = Settings()
    
    let defaultSettings = GameSettings(timerState: true, gameDuration: 40)
    
    var currentSettings: GameSettings{
        get{
            if let data = UserDefaults.standard.object(forKey: KeysUserDefaults.settingsGame) as? Data{
                return try! PropertyListDecoder().decode(GameSettings.self, from: data)
            }else{
                if let data = try? PropertyListEncoder().encode(defaultSettings){
                    UserDefaults.standard.setValue(data, forKey: KeysUserDefaults.settingsGame)
                }
                return defaultSettings
        }
        set{
//            do{
//                let data = try PropertyListEncoder().encode(newValue)
//
//            }catch{
//
//            }
            if let data = try? PropertyListEncoder().encode(newValue){
                UserDefaults.standard.setValue(data, forKey: KeysUserDefaults.settingsGame)
            }
        }
    }
}
