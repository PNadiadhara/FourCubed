//
//  MapTableAndCollectionView.swift
//  FourCubed
//
//  Created by Jose Alarcon Chacon on 2/14/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import UIKit


class MapTableAndCollectionView: UIView {
  
    var venue = VenueView()
    var mapView = MapKitView()
    
    var desplayView: UIView!
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        self.venue.myCollectionView.register(VenueCell.self, forCellWithReuseIdentifier: "venuesCell")
        setConstraints()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setConstraints() {
        addSubview(mapView)
        addSubview(venue)
        
        venue.translatesAutoresizingMaskIntoConstraints = false
        mapView.translatesAutoresizingMaskIntoConstraints = false
        venue.myCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        mapView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        mapView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        mapView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -0).isActive = true
        mapView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
        
        venue.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 0).isActive = true
        venue.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        venue.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        venue.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        venue.myCollectionView.translatesAutoresizingMaskIntoConstraints = false
        venue.myCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 450).isActive = true
        venue.myCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        venue.myCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        venue.myCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
