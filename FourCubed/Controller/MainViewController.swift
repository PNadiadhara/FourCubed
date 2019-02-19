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

class MainViewController: UIViewController,  CLLocationManagerDelegate, UICollectionViewDelegateFlowLayout {
   
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
    
    var locationManager = CLLocationManager()
    
    let center = UNUserNotificationCenter.current()
    //var delegate1: VenuesViewButtonDelegate?
    


    var venueView = VenueView()
    
    var listView = ListVenueView()
    // venueToShow VARIABLE ONLY HAS NAME VARIABLE, venues VARIABLE HAS MORE INFORMATION, SUGGEST DELETE venueToShow VARIABLE
    var venueToShow = [CatagoryData]()
   
    private var annoations = [MKAnnotation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        venueView.searchBarView.delegate = self
        venueView.mapViewKit.delegate = self
        title = "Search"
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
        self.present(listVC, animated: true, completion:  nil)
        
        
    }
    
    @objc func centerOnUserButtonPressed() {
        venueView.mapViewKit.userLocation
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
                dump(self.venues)
                }
            }
        }
    }
    
    func getPhoto(keyword: String) {
        PhotoAPIClient.searchPhoto(venueID: keyword, date: Date.getISOTimestamp()) { (error, data) in
            if let error = error {
                DispatchQueue.main.async {
                    
                }
            }
        }
    }
    


//    GoogleAPIClient.getBookImages(keyword: cellToSet.book_details[0].primary_isbn13) { (error, data) in
//    if let error = error {
//    DispatchQueue.main.async {
//    cell.bookImage.image = UIImage(named: "bookplaceholder")
//    }
//    print(error.errorMessage())
//    } else if let data = data {
//    ImageHelper.fetchImageFromNetwork(urlString: data[0].volumeInfo.imageLinks.smallThumbnail.absoluteString, completion: { (error, image) in
//    if let error = error {
//    print(error.errorMessage())
//    } else if let image = image {
//    DispatchQueue.main.async {
//    cell.bookImage.image = image
//    }
//    }
//    })
//    }
//    }
 
    

    
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
    
        //self.venueView.searchBarView.endEditing(true)
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
        detailVC.modalTransitionStyle = .crossDissolve
        detailVC.modalPresentationStyle = .overCurrentContext
        self.present(detailVC, animated: true, completion: nil)
        guard let annotation = view.annotation else { fatalError("annotation nil") }
        
        mapView.deselectAnnotation(annotation, animated: true)
        
    
        
    }
    
    

}

extension MainViewController {
    
}
