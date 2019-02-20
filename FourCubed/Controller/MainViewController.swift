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
                self.getVenue(keyword: self.userSearchQuery)
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

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        venueView.searchBarView.delegate = self
        venueView.mapViewKit.delegate = self
        self.view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "list"), style: .plain, target: self, action: #selector(listPressed))
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

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        let currentLocation = map.mapView.mapViewKit.userLocation
        let myCurrentRegion = MKCoordinateRegion(center: currentLocation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        map.mapView.mapViewKit.setRegion(myCurrentRegion, animated: true)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let currentLocation = locations.last else { return }
        let myCurrentRegion = MKCoordinateRegion(center: currentLocation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        map.mapView.mapViewKit.setRegion(myCurrentRegion, animated: true)
    }
}

extension MainViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        userSearchQuery = venueView.searchBarView.text ?? "tacos"
        searchBar.resignFirstResponder()
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
        detailVC.detailOfAddress = detailVC.detailData.location?.address
        detailVC.detailOfCategories = detailVC.detailData.categories[0].name
        detailVC.detailOfCity = detailVC.detailData.location?.city
        
        
//        self.present(detailVC, animated: true, completion: nil) // doing monorlly using this type to call
        navigationController?.pushViewController(detailVC, animated: true) // doing navigation using this type so button will show up on the top right or left 
        mapView.deselectAnnotation(annotation, animated: true)
    }
    func displayMapAtLatitude(latitude: Double, longitude: Double) {
        var region = map.mapView.mapViewKit.region
        region.center = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        venueView.mapViewKit.setRegion(region, animated: true)
    }
}
