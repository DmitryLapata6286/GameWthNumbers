//
//  YellowViewController.swift
//  FindNumber
//
//  Created by Dmitry Lapata on 25.04.22.
//

import UIKit

class YellowViewController: UIViewController {
    // MARK: - Outlets
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions

    @IBAction func goToBlueController(_ sender: Any) {
        performSegue(withIdentifier: "goToBlue", sender: nil)
    }
    
    // MARK: - Methods

    
    // MARK: - Navigation


}
