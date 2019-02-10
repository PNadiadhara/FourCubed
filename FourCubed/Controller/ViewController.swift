//
//  ViewController.swift
//  FourCubed
//
//  Created by Pritesh Nadiadhara on 2/8/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    var venueView = VenueView()
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setMapKit()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home Page"
        self.view.backgroundColor = .white
        view.addSubview(venueView)
        VenueAPIClient.searchVenue() { (appError, data) in
            print("calling API")
            if let appError = appError {
                print("error is \(appError)")
            }
            if let data = data {
                print("Data is \(data)")
                DispatchQueue.main.async {
                        print("whatever")
                }
            }
        }
    }
    func setMapKit() {
        let mapView = MKMapView()
        let leftMargin:CGFloat = 10
        let topMargin:CGFloat = 100
        let mapWidth:CGFloat = view.frame.size.width-20
        let mapHeight:CGFloat = 300
        mapView.frame = CGRect(x: leftMargin, y: topMargin, width: mapWidth, height: mapHeight)
        mapView.mapType = MKMapType.standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        mapView.center = view.center
        view.addSubview(mapView)
    }
}
