//
//  BlueViewController.swift
//  FindNumber
//
//  Created by Dmitry Lapata on 25.04.22.
//

import UIKit

class BlueViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var getDataLabel: UILabel!
    
    var varForTransferLabel = ""
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        getDataLabel.text = varForTransferLabel
        // Do any additional setup after loading the view.
    }
    // MARK: - Actions
    @IBAction func goToGreenController(_ sender: Any) {
        //init ViewController in Main StoryBoard
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "greenVC") as? GreenViewController{
            vc.variableForMessage = "Some massage"  //transfer message from blueVC to greenVC
            vc.title = "Green" //add title to greenVC
            self.navigationController?.pushViewController(vc, animated: true)  // add new VC to array of ViewControllers
        }
    }
    

    // MARK: - Methods
    

    // MARK: - Navigation

}
