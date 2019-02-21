//
//  FavoriteDetailViewController.swift
//  FourCubed
//
//  Created by TingxinLi on 2/12/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import UIKit
import MapKit

class ListVenueDetailViewController: UIViewController {
    
    let searchDetailView = ListVenueDetailView()
    //    var listDetailData: Venue!
    var detailPhoto: PhotoInfo!
    public var detailData: Venue!
    public var venueImages: UIImage?
    public var detailOfAddress: String?
    public var detailOfCategories: String?
    public var detailOfCity: String?
    var locationManager = CLLocationManager()
    
    var venueTitle = String()
    var venueAddres = String()
    var venueDescription = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Favorite", style: .plain, target: self, action: #selector(favoriteButtonPressed))
        self.searchDetailView.mapButton.addTarget(self, action: #selector(mapButtonPressed), for: .touchUpInside)
        view.addSubview(searchDetailView)
        view.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
       // dump(detailData)
        setupData()
    }
    @objc func mapButtonPressed() {
        openMapForPlace()
    }
    func openMapForPlace() {
        guard let currentLocation = locationManager.location?.coordinate else {
            print("no location found")
            return
        }
        let latitude: CLLocationDegrees = currentLocation.latitude
        let longitude: CLLocationDegrees = currentLocation.longitude
        
        let regionDistance:CLLocationDistance = 10000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = detailData.name//"Place Name"
        mapItem.openInMaps(launchOptions: options)
    }
    func setupData() {
        searchDetailView.detailName.text = detailData.name
                if let images = venueImages {
                    searchDetailView.detailImage.image = images
                }
        searchDetailView.categoriesLabel.text = detailData.categories[0].name
        
        if let address = detailData.location?.address {
            searchDetailView.addressLabel.text = address
        }
        
        if let city = detailData.location?.city {
            searchDetailView.cityLabel.text = city
        }
    }
    private func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { alert in }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func favoriteButtonPressed() {
        if let name = searchDetailView.detailName.text, let address = searchDetailView.addressLabel.text, let image = searchDetailView.detailImage.image {
            let timestamp = Date.getISOTimestamp()
            guard let address = searchDetailView.addressLabel.text else {
                return print("no descriptions data")
            }
            guard let names = searchDetailView.detailName.text else {
                return print("no authors data")
            }
            guard let images = image.jpegData(compressionQuality: 0.5) else {
                return print("no image data")
            }
            let favortie = Favorite.init(createdAt: timestamp, imageData: images, name: names, description: address)
            if detailData != nil {
                VenuesModel.addVenues(item: favortie)
                showAlert(title: "\(detailData.name)", message: "will be saved in your collection")
            }
        }
    }
}
func mapButtonPressed() {
    
}




