//
//  ListViewController.swift
//  FourCubed
//
//  Created by Jose Alarcon Chacon on 2/11/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import UIKit

var selectedVenue = String()

class ListVenueViewController: UIViewController {

    var venueDetailCell = ListVenueDetailTableViewCell()
    var listView = ListVenueView()
    var venueCell = ListVenueDetailTableViewCell()
    var listData = [Venue]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(listView)
        view.backgroundColor = .white
        title = "Search for Venues"
        listView.tableViewList.dataSource = self
        listView.tableViewList.delegate = self
        listView.tableViewList.register(ListVenueDetailTableViewCell.self, forCellReuseIdentifier: "SearchDetail")
        
        
    }
}

extension ListVenueViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Place holder until segue is coordinated
        return 20
      
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Place holder until segue is coordinated with
        guard let cell = listView.tableViewList.dequeueReusableCell(withIdentifier: "SearchDetail", for: indexPath) as? ListVenueDetailTableViewCell else {return UITableViewCell()}
//        let venuesInfo = listData[indexPath.row]
//        cell.venueName.text = venuesInfo.name
//        cell.venueAddress.text = venuesInfo.location?.address
//        cell.venueCatagories.text = venuesInfo.categories[0].name

        return cell

}
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         //Place holder until segue is coordinated with
         let listDtailCell = listData[indexPath.row]
//         let list = ListVenueDetailViewController(venueTitle: listDtailCell.name)
//        selectedVenue = listDtailCell.categories[0].name
//        navigationController?.pushViewController(list, animated: true)
        
       
    }
}
/*
 
 */
