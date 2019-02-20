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

class MainViewController: UIViewController, CLLocationManagerDelegate, UICollectionViewDelegateFlowLayout  {
    
    var venues = [Venue]() {
        didSet{
            DispatchQueue.main.async {
                self.makeAnnotations()
                
            }
        }
    }
    
    var userSearchQuery = String() {
        didSet {
            DispatchQueue.main.async {
                if self.userChoseNewSearchArea {
                    self.getVenueInArea(location: self.userChosenArea, keyword: self.userSearchQuery)
                } else {
                    self.getVenue(keyword: self.userSearchQuery)
                }
            }
        }
    }
    
    var map = MapTableAndCollectionView()
    var locationManager = CLLocationManager()
    let center = UNUserNotificationCenter.current()
    //var delegate1: VenuesViewButtonDelegate?
    var venueView = VenueView()
    var listView = ListVenueView()
    var venueToShow = [CatagoryData]()
    private var annoations = [MKAnnotation]()
    var userChoseNewSearchArea = false
    private var userChosenArea = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        venueView.buttonFour.addTarget(self, action: #selector(centerOnUserButtonPressed), for: .touchUpInside)
        
        venueView.searchBarView.delegate = self
        venueView.mapViewKit.delegate = self
        self.view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "list"), style: .plain, target: self, action: #selector(listPressed))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Location", style: .plain, target: self, action: #selector(locationSetting))
        
        
        view.addSubview(venueView)
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
            venueView.mapViewKit.showsUserLocation = true
            
        } else {
            locationManager.requestWhenInUseAuthorization()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
            venueView.mapViewKit.showsUserLocation = true
        }
        getVenue(keyword: "tacos")
    }
    
    
    @objc func listPressed() {
        let listVC = ListVenueViewController()
        listVC.modalTransitionStyle = .crossDissolve
        listVC.modalPresentationStyle = .overCurrentContext
        // listVC.item = item
        navigationController?.pushViewController(listVC, animated: true)
        
        
    }
    
    @objc func locationSetting () {
        
        
        let locationActionSheet =  UIAlertController(title: "Location Settings", message: "Configure Location Information", preferredStyle: .actionSheet)
        
        
        
        let userEnterLocation = UIAlertAction(title: "Enter Location", style: .default) { (alert: UIAlertAction!) in
            self.userEnterLocationInfo()
            print("user enters location")
        }
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            self.dismiss(animated: true, completion: nil)
        }
        
        
        locationActionSheet.addAction(userEnterLocation)
        locationActionSheet.addAction(cancelAction)
        
        present(locationActionSheet, animated: true, completion: nil)
        
    }
    
    func userEnterLocationInfo() {
        
        
        let alert = UIAlertController(title: "Enter Location",
                                      message: "",
                                      preferredStyle: .alert)
        
        alert.addTextField { (textField: UITextField) in
            textField.keyboardAppearance = .dark
            textField.keyboardType = .default
            textField.autocorrectionType = .default
            textField.placeholder = "Enter City Name"
            textField.clearButtonMode = .whileEditing
            
            
        }
        
        let submitAction = UIAlertAction(title: "Submit", style: .default, handler: { (action) -> Void in
            
            let textField = alert.textFields![0]
            self.userChosenArea = textField.text ?? ""
            self.userChoseNewSearchArea = true
            print(textField.text!)
            self.getVenueInArea(location: textField.text!, keyword: self.userSearchQuery)
            
        })
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: { (action) -> Void in })
        
        alert.addAction(submitAction)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
        
        
    }
    
    @objc func centerOnUserButtonPressed() {
        venueView.mapViewKit.userLocation
        print("button pressed")
    }
    
    
    
    
    func getVenue(keyword: String) {
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
                    
                    self.venues = data
                    //dump(self.venues)
                }
            }
        }
    }
    
    func getVenueInArea(location: String, keyword: String) {
        
        
        let date = Date.getISOTimestamp()
        VenueAPIClient.searchLocation(location: location, keyword: keyword, date: date.formatISODateString(dateFormat: "yyyyMMDD")) { (appError, data) in
            DispatchQueue.main.async {
                if let appError = appError {
                    print(appError.errorMessage())
                }   else if let data = data {
                    
                    self.venues = data
                    //dump(self.venues)
                }
            }
        }
    }
    
    
    
    
    
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        //        let currentLocation = venueView.mapViewKit.userLocation
        //        let myCurrentRegion = MKCoordinateRegion(center: currentLocation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        //        venueView.mapViewKit.setRegion(myCurrentRegion, animated: true)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //        guard let currentLocation = locations.last else { return }
        //        let myCurrentRegion = MKCoordinateRegion(center: currentLocation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        //        venueView.mapViewKit.setRegion(myCurrentRegion, animated: true)
        
        
        
        
        
    }
}

extension MainViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        userSearchQuery = venueView.searchBarView.text ?? "tacos"
        searchBar.resignFirstResponder()
        
        
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.venueView.searchBarView.endEditing(true)
    }
    
    
}
extension MainViewController : MKMapViewDelegate {
    private func makeAnnotations() {
        venueView.mapViewKit.removeAnnotations(annoations)
        annoations.removeAll()
        for venue in venues {
            let annotation = MKPointAnnotation()
            //NOTE: COORDINATE IS BEING FORCE UNWWRAPPED, MAY CAUSE ISSUE LATER
            annotation.coordinate = (venue.location?.coordinate)!
            annotation.title = venue.name
            annoations.append(annotation)
        }
        venueView.mapViewKit.showAnnotations(annoations, animated: true)
    }
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("Annotation slected")
        let detailVC = ListVenueDetailViewController()
        guard let annotation = view.annotation else { fatalError("annotation nil") }
        
        
        detailVC.modalTransitionStyle = .crossDissolve
        detailVC.modalPresentationStyle = .overCurrentContext
        detailVC.detailOfAddress = detailVC.detailData.location?.address ?? "N/A"
        detailVC.detailOfCategories = detailVC.detailData.categories[0].name
        detailVC.detailOfCity = detailVC.detailData.location?.city
        
        
        //        self.present(detailVC, animated: true, completion: nil) // doing monorlly using this type to call
        navigationController?.pushViewController(detailVC, animated: true) // doing navigation using this type so button will show up on the top right or left 
        mapView.deselectAnnotation(annotation, animated: true)
    }
    
    
    
    
}

