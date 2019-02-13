//
//  SettingsViewController.swift
//  FourCubed
//
//  Created by TingxinLi on 2/11/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let settingsView = SettingsView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(settingsView)
        settingsView.myTableView.dataSource = self
        settingsView.myTableView.delegate = self
        settingsView.myTableView.register(SetttingLocationTableViewCell.self, forCellReuseIdentifier: "EnableLocation")
    }
    

   

}

extension SettingsViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = settingsView.myTableView.dequeueReusableCell(withIdentifier: "EnableLocation", for: indexPath) as? SetttingLocationTableViewCell else {return UITableViewCell()}
        cell.enableLocationLabel.text = "Location Services"
        return cell
        
    }
    
    
}
