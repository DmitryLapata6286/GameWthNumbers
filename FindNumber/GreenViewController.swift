//
//  GreenViewController.swift
//  FindNumber
//
//  Created by Dmitry Lapata on 25.04.22.
//

import UIKit

class GreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func goToRoot(_ sender: Any) {
        //self.navigationController?.popToRootViewController(animated: true)   // toRootView
        
        //to Yellow, example
        guard let arrayVC = self.navigationController?.viewControllers else{return}
        for vc in arrayVC {
            if vc is YellowViewController{
                self.navigationController?.popToViewController(vc, animated: true)
            }
        }
        
        
    }
}
