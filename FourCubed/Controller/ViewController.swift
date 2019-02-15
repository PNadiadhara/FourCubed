//
//  ViewController.swift
//  FourCubed
//
//  Created by Pritesh Nadiadhara on 2/8/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
import UserNotifications

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
   
    var venues = [Venue]() {
        didSet{
        DispatchQueue.main.async {
            self.venueView.myCollectionView.reloadData()
        }
        }
    }
    
    var locationManager = CLLocationManager()
    let center = UNUserNotificationCenter.current()
    var delegate1: VenuesViewButtonDelegate?
    

    var mapTableAndCollectionView = MapTableAndCollectionView()

    var venueView = VenueView()

    var settingCell = VenueCell()
    var listView = ListView()
    
    var venueToShow = [CatagoryData]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        self.view.backgroundColor = .white
        view.addSubview(mapTableAndCollectionView)
        self.venueView.myCollectionView.dataSource = self
        venueView.myCollectionView.delegate = self
        venueView.myCollectionView.dataSource = self
        locationManager.delegate = self
        venueView.myCollectionView.reloadData()
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
            mapTableAndCollectionView.mapView.mapViewKit.showsUserLocation = true

        } else {
            locationManager.requestWhenInUseAuthorization()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
            mapTableAndCollectionView.mapView.mapViewKit.showsUserLocation = false
        }

        getVenue(keyword: "tacos")
        


    }
    func getVenue(keyword: String) {
        guard let currentLocation = locationManager.location?.coordinate else {print("no location found")
            return
        }
        let myCurrentLocation = "\(currentLocation.latitude),\(currentLocation.longitude)"
        let date = Date.getISOTimestamp()
        VenueAPIClient.searchVenue(location: myCurrentLocation, keyword: keyword, date: date.formatISODateString(dateFormat: "yyyyMMDD")) { (appError, data) in
            DispatchQueue.main.async {
                
            
            if let appError = appError {
                print(appError.errorMessage())
            } else if let data = data {
                
                self.venues = data
//                dump(self.venues)

                
            }
            }
            
        }
    }

        

       
        let rightBarButton = UIBarButtonItem(title: "Venues", style: UIBarButtonItem.Style.plain, target: self, action: #selector(changeView))
        print(rightBarButton)
        self.navigationItem.rightBarButtonItem = rightBarButton
        rightBarButton.tintColor = .black
        
//        VenueAPIClient.searchVenue(location: <#String#>, keyword: "venues", date: <#String#>) { (appError, data) in
//            print("calling API")
//            if let appError = appError {
//                print("error is \(appError)")
//            }
//            if let data = data {
//                print("Data is \(data)")
//                DispatchQueue.main.async {
//                        print("whatever")
//                }
//            }
//        }
    }
    let list = ListViewController()
    @objc func changeView(_ sender: UIBarButtonItem) {
        print("Button was \(sender)")
        if mapTableAndCollectionView.mapView == mapTableAndCollectionView.mapView {
            self.navigationController?.pushViewController(self.list, animated: true)


            // reference for transition
            //https://developer.apple.com/documentation/uikit/uiview/1622562-transition
        }


     }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        let currentLocation = mapTableAndCollectionView.mapView.mapViewKit.userLocation
        let myCurrentRegion = MKCoordinateRegion(center: currentLocation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapTableAndCollectionView.mapView.mapViewKit.setRegion(myCurrentRegion, animated: true)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let currentLocation = locations.last else { return }
        let myCurrentRegion = MKCoordinateRegion(center: currentLocation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapTableAndCollectionView.mapView.mapViewKit.setRegion(myCurrentRegion, animated: true)
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return venues.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "venuesCell", for: indexPath) as? VenueCell else {
            return UICollectionViewCell()}

        let cellToSet = venues[indexPath.row]
        cell.layer.cornerRadius = 40
        cell.nameOfLabel.text = cellToSet.name

        cell.layer.cornerRadius = 30

        cell.layer.masksToBounds = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}

