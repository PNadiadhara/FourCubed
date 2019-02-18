//
//  ListViewController.swift
//  FourCubed
//
//  Created by Jose Alarcon Chacon on 2/11/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import UIKit

// 
class ListVenueViewController: UIViewController {

    var venueDetailCell = ListVenueDetailTableViewCell()
    var listView = ListVenueView()
    var listData = [Venue]() 

   var photoData = [PhotoStatus]()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(listView)
        view.backgroundColor = .white
        title = "Search for Venues"
        listView.tableViewList.dataSource = self
        listView.tableViewList.delegate = self
        listView.tableViewList.register(ListVenueDetailTableViewCell.self, forCellReuseIdentifier: "SearchDetail")
        tabBarController?.delegate = UIApplication.shared.delegate as? UITabBarControllerDelegate
        
    }
}

extension ListVenueViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Place holder until segue is coordinated with Jose
        return 20
      
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Place holder until segue is coordinated with Jose
        guard let cell = listView.tableViewList.dequeueReusableCell(withIdentifier: "SearchDetail", for: indexPath) as? ListVenueDetailTableViewCell else {return UITableViewCell()}
        return cell

}
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Place holder until segue is coordinated with Jose
//        let listDtailCell = listData[indexPath.row]
//        let listDetailVC = ListVenueDetailTableViewCell()
    }
}
