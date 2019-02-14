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
    var delegate1: VenuesViewButtonDelegate?
    
    var venueView = VenueView()
    var settingCell = VenueCell()
    var listView = UIView()
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home Page"
        self.view.backgroundColor = .white
        view.addSubview(venueView)
        venueView.myCollectionView.delegate = self
        venueView.myCollectionView.dataSource = self
        locationManager.delegate = self
        // set each cell in the collection view
        venueView.myCollectionView.register(VenueCell.self, forCellWithReuseIdentifier: cellId)

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
        let rightBarButton = UIBarButtonItem(title: "Venues", style: UIBarButtonItem.Style.plain, target: self, action: #selector(changeView))
        print(rightBarButton)
        self.navigationItem.rightBarButtonItem = rightBarButton
        rightBarButton.tintColor = .black
        
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
    let list = ListViewController()
    @objc func changeView(_ sender: UIBarButtonItem) {
        print("Button was \(sender)")
        if venueView.mapViewKit == venueView.mapViewKit {
            self.navigationController?.pushViewController(self.list, animated: true)
        }
     }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        let currentLocation = venueView.mapViewKit.userLocation
        let myCurrentRegion = MKCoordinateRegion(center: currentLocation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        venueView.mapViewKit.setRegion(myCurrentRegion, animated: true)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let currentLocation = locations.last else { return }
        let myCurrentRegion = MKCoordinateRegion(center: currentLocation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
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

