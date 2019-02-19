//
//  ListViewController.swift
//  FourCubed
//
//  Created by Jose Alarcon Chacon on 2/11/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import UIKit
import CoreLocation

// 
class ListVenueViewController: UIViewController, CLLocationManagerDelegate {

    var listView = ListVenueView()
    var listData = [Venue]() {
        didSet {
            DispatchQueue.main.async {
                self.listView.tableViewList.reloadData()
            }
        }
    }
    
    var listPhoto = [PhotoInfo]()
    
    var locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        getListVenue(keyword: "tacos")
        view.addSubview(listView)
        view.backgroundColor = .white
        title = "Search for Venues"
        listView.tableViewList.dataSource = self
        listView.tableViewList.delegate = self
        listView.tableViewList.register(ListVenueDetailTableViewCell.self, forCellReuseIdentifier: "SearchDeatil")
    }
    
    func getListVenue(keyword: String) {
        guard let currentLocation = locationManager.location?.coordinate else {
            print("no location found")
            return
        }
        let myCurrentLocation = "\(currentLocation.latitude),\(currentLocation.longitude)"
        let date = Date.getISOTimestamp()
        VenueAPIClient.searchVenue(location: myCurrentLocation, keyword: keyword, date: date.formatISODateString(dateFormat: "yyyyMMDD")) { (appError, data) in
            DispatchQueue.main.async {
                if let appError = appError {
                    print(appError.errorMessage())
                }   else if let data = data {
                    
                    self.listData = data
                    //dump(self.venues)
                }
            }
        }
    }
    
//    func getListPhoto() {
//        guard let currentLocation = locationManager.location?.coordinate else {
//            print("no location found")
//            return
//        }
       // let myCurrentLocation = "\(currentLocation.latitude),\(currentLocation.longitude)"
//        let date = Date.getISOTimestamp()
//        PhotoAPIClient.searchPhoto(venueID: listPhoto[0].items[0].id, date: date.formatISODateString(dateFormat: "yyyyMMDD")) { (appError, image) in
//            DispatchQueue.main.async {
//                if let appError = appError {
//                    print(appError.errorMessage())
//                }  else if let images = image {
//
//
//                }
//            }
//        }
//    }
    
    
    
    
}

extension ListVenueViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Place holder until segue is coordinated with Jose
        return listData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Place holder until segue is coordinated with Jose
        guard let cell = listView.tableViewList.dequeueReusableCell(withIdentifier: "SearchDeatil", for: indexPath) as? ListVenueDetailTableViewCell else {return UITableViewCell()}

       let listVenues = listData[indexPath.row]

       cell.venueName.text = listVenues.name
        cell.venueAddress.text = listVenues.location?.address
       cell.venueCatagories.text = listVenues.categories[0].name

        let date = Date.getISOTimestamp()
        
        let id = listVenues.referralId.replacingOccurrences(of: "v-", with: "") ?? "no id"
        
        PhotoAPIClient.searchPhoto(venueID: id, date: date.formatISODateString(dateFormat: "yyyyMMDD")) { (appError, image) in
            DispatchQueue.main.async {
                if let appError = appError {
                    print(appError.errorMessage())
                }

                if image != nil {
                    
//                    let prefix = self.listPhoto.first?.items.first?.prefix ?? "no prefix"
                    if let prefix = image?.first?.prefix, let suffix = image?.first?.suffix {
                        
//                    let suffix = self.listPhoto.first?.items.first?.suffix ?? "no suffix"
                    
                    let imageToSet = prefix + "300x500" + suffix
                    ImageHelper.shared.fetchImage(urlString: imageToSet) { (appError, image) in
                        if let appError = appError {
                            print(appError.errorMessage())

                        }else if let image = image {
                            cell.venueImage.image = image

                        }
                    }
                }
                }
            }
        }
        return cell

}
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let listDetailCell = listData[indexPath.row]
        let detailListVC = ListVenueDetailViewController()
        detailListVC.detailData = listDetailCell


//       presentedViewController(ListVenueDetailViewController.self,animated: true)
        self.navigationController?.pushViewController(detailListVC, animated: true)
    }
}
