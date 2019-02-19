//
//  FavoriteDetailViewController.swift
//  FourCubed
//
//  Created by TingxinLi on 2/12/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import UIKit

class ListVenueDetailViewController: UIViewController {

    let searchDetailView = ListVenueDetailView()
//    var listDetailData: Venue!
    public var detailData: Venue!
//    public var image: UIImage?
    public var detailOfAddress: String?
       public var detailOfCategories: String?
       public var detailOfCity: String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Favorite", style: .plain, target: self, action: #selector(favoriteButtonPressed))
        
        view.addSubview(searchDetailView)
        view.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        dump(detailData)
       setupData()
        
    }
    
    func setupData() {
        
        searchDetailView.detailName.text = detailData.name
        

//        if let images = imageOfBooks {
//            detailView.detailBookImage.image = images
//        }
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
        if let name = searchDetailView.detailName.text, let descriptions = searchDetailView.addressLabel.text {
            let timestamp = Date.getISOTimestamp()
            
            guard let address = searchDetailView.addressLabel.text else {
                return print("no descriptions data")
            }
            guard let names = searchDetailView.detailName.text else {
                return print("no authors data")
            }
//            guard let imageData = image.jpegData(compressionQuality: 0.5) else {
//                return print("no image data")
//            }
            
            let favortie = Favorite.init(createdAt: timestamp, name: names, description: descriptions)
            
            if let bookDetail = detailData {
                VenuesModel.addVenues(item: favortie)
                showAlert(title: "Save", message: "Image Saved")
            }
            
            
            
        }
    }
    
    
}
