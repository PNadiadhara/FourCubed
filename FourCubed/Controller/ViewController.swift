//
//  ViewController.swift
//  FourCubed
//
//  Created by Pritesh Nadiadhara on 2/8/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    var mapView: MKMapView!
    let locationManager = CLLocationManager()
    var venueView = VenueView()
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home Page"
        self.view.backgroundColor = .white
        view.addSubview(venueView)
        locationManager.delegate = self
        
//
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
  
}
