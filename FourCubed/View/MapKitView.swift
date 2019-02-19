//
//  MapKitView.swift
//  FourCubed
//
//  Created by Jose Alarcon Chacon on 2/14/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import UIKit
import MapKit

class MapKitView: UIView {

    lazy var mapViewKit: MKMapView = {
        let mapView = MKMapView()
        return mapView
    }()
    
    lazy var centerOnUser: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "home"), for: .normal)
        button.addTarget(self, action: #selector(centerMapOnUser), for: .touchUpInside)
        return button
    }()
    
    @objc func centerMapOnUser(){
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
        setUpMapKit()
        setUpCenterOnUserButton()
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func commonInit() {
        setUpMapKit()
        setUpCenterOnUserButton()
    }
    private func setUpMapKit() {
        addSubview(mapViewKit)
        
        mapViewKit.translatesAutoresizingMaskIntoConstraints = false
        mapViewKit.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 2).isActive = true
        mapViewKit.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        mapViewKit.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -0).isActive = true
        mapViewKit.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1).isActive = true
    }
    
    private func setUpCenterOnUserButton () {
        addSubview(centerOnUser)
        
        centerOnUser.translatesAutoresizingMaskIntoConstraints = false
        [centerOnUser.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 22),
         centerOnUser.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -22)].forEach{$0.isActive = true}
    }
}
