//
//  SelectTimeViewController.swift
//  FindNumber
//
//  Created by Dmitry Lapata on 26.04.22.
//

import UIKit

class SelectTimeViewController: UIViewController {
    
    var data:[Int] = []
    // MARK: - Outlets
    @IBOutlet weak var selectTimetableView: UITableView!{
        didSet{
            selectTimetableView?.dataSource = self
            selectTimetableView?.delegate = self
        }
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - Actions
    
    // MARK: - Methods
    
    // MARK: - Navigation


}

extension SelectTimeViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = selectTimetableView.dequeueReusableCell(withIdentifier: "timeCell", for: indexPath)
        cell.textLabel?.text = "\(data[indexPath.row]) seconds"
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectTimetableView.deselectRow(at: indexPath, animated: true)
        Settings.shared.currentSettings.gameDuration = data[indexPath.row]
        navigationController?.popToViewController(animated: true)
    }
}
