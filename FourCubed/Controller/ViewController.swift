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
   
    var locationManager = CLLocationManager()
    let center = UNUserNotificationCenter.current()
    
    var venueView = VenueView()
    var settingCell = VenueCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home Page"
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
        let rightBarButton = UIBarButtonItem(title: "Map", style: UIBarButtonItem.Style.plain, target: self, action: #selector(apdateAlert))
        print(rightBarButton)
        self.navigationItem.rightBarButtonItem = rightBarButton
        
//        VenueAPIClient.searchVenue() { (appError, data) in
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
    @objc func apdateAlert() {
//        UIView.transition(with: venueView.mapViewKit, duration: 1.0, options: .transitionFlipFromRight, animations: {
//            venueView.mapViewKit =  [IndexPath.row]
//        }, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
//        print("Tapped")
//    }
    /*
     if cell.myLabel.text == titleInfo {
     UIView.transition(with: cell, duration: 1.0, options: .transitionFlipFromLeft, animations: {
     cell.myLabel.text = self.facts[indexPath.row]
     })
     } else {
     UIView.transition(with: cell, duration: 1.0, options: .transitionFlipFromRight, animations: {
     cell.myLabel.text = self.titleInfo
     })
     }
 */
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        let currentLocation = venueView.mapViewKit.userLocation
        let myCurrentRegion = MKCoordinateRegion(center: currentLocation.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        venueView.mapViewKit.setRegion(myCurrentRegion, animated: true)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let currentLocation = locations.last else { return }
        let myCurrentRegion = MKCoordinateRegion(center: currentLocation.coordinate, latitudinalMeters: 100, longitudinalMeters: 100)
        venueView.mapViewKit.setRegion(myCurrentRegion, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "venuesCell", for: indexPath) as? VenueCell else {
            return UICollectionViewCell()}
        cell.layer.cornerRadius = 40
        cell.layer.masksToBounds = true
        return cell
    }
}

