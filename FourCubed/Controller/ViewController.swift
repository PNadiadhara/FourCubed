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
    
    var venueView = VenueView()
    var settingCell = VenueCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        self.view.backgroundColor = .white
        view.addSubview(venueView)
        venueView.myCollectionView.delegate = self
        venueView.myCollectionView.dataSource = self
        locationManager.delegate = self

        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
            venueView.mapViewKit.showsUserLocation = true

        } else {
            locationManager.requestWhenInUseAuthorization()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
            venueView.mapViewKit.showsUserLocation = false
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

        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return venues.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "venuesCell", for: indexPath) as? VenueCell else {
            return UICollectionViewCell()}
        let cellToSet = venues[indexPath.row]
        cell.layer.cornerRadius = 40
        cell.nameOfLabel.text = cellToSet.name
        cell.layer.masksToBounds = true
        return cell
    }
}

