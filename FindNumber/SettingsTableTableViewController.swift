//
//  SettingsTableTableViewController.swift
//  FindNumber
//
//  Created by Dmitry Lapata on 26.04.22.
//

import UIKit

class SettingsTableTableViewController: UITableViewController {
    // MARK: - Outlets
    @IBOutlet weak var timerSwitcher: UISwitch!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    @IBAction func changeTimerState(_ sender: UISwitch) {
        Settings.shared.currentSettings.timerState = sender.isOn
    }
    
    // MARK: - Methods
    
    // MARK: - Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier{
        case "selectTimeVC":
            guard let vc = segue.destination as? SelectTimeViewController else {return}
            vc.data = [10,20,30,40,50,60,70,80,90,100,110,120]
            break
        default:
            break
        }
    }
    // MARK: - Navigation

}
