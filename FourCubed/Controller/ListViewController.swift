//
//  ListViewController.swift
//  FourCubed
//
//  Created by Jose Alarcon Chacon on 2/11/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    var listView = ListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(listView)
        view.backgroundColor = .white
        listView.tableViewList.dataSource = self
        listView.tableViewList.delegate = self
        listView.tableViewList.register(SearchDetailTableViewCell.self, forCellReuseIdentifier: "SearchDetail")
    }
}

extension ListViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Place holder until segue is coordinated with Jose
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Place holder until segue is coordinated with Jose
        guard let cell = listView.tableViewList.dequeueReusableCell(withIdentifier: "SearchDetail", for: indexPath) as? SearchDetailTableViewCell else {return UITableViewCell()}
        cell.venueLabel.text = "This is a place from main searchview controller"
        return cell
    
    
}
}
