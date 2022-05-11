//
//  RecordViewController.swift
//  FindNumber
//
//  Created by Dmitry Lapata on 4.05.22.
//

import UIKit

class RecordViewController: UIViewController {

    @IBOutlet weak var recordTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let record = UserDefaults.standard.integer(forKey: KeysUserDefaults.recordGame)
        if record != 0 {
            recordTitle.text = "Current record: \(record) seconds"
        }else{
            recordTitle.text = "Not yet any record :("
        }

    }

}
