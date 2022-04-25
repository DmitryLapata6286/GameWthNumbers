//
//  BlueViewController.swift
//  FindNumber
//
//  Created by Dmitry Lapata on 25.04.22.
//

import UIKit

class BlueViewController: UIViewController {
    // MARK: - Outlets
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    // MARK: - Actions
    @IBAction func goToGreenController(_ sender: Any) {
        //init ViewController in Main StoryBoard
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "greenVC")
        vc.title = "Green"
        // add new VC to array of ViewControllers
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

    // MARK: - Methods
    

    // MARK: - Navigation

}
