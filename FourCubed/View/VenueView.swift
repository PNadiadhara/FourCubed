//
//  VenueView.swift
//  FourCubed
//
//  Created by Jose Alarcon Chacon on 2/9/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import UIKit
import MapKit

class VenueView: UIView {
   
    lazy var mapViewKit: MKMapView = {
        let mapView = MKMapView()
        return mapView
    }()

  
    lazy var searchBarView: UISearchBar = {
        let searchBar = UISearchBar()
        return searchBar
    }()
    
    lazy var buttonOne: UIButton = {
        let button1 = UIButton()
        button1.setImage(UIImage(named: "icons8-champagne_filled"), for: .normal)
        button1.addTarget(self, action: #selector(barButton), for: .touchUpInside)
        return button1
    }()
    @objc func barButton(){
        
    }
    
    lazy var buttonTwo: UIButton = {
        let button2 = UIButton()
        button2.setImage(UIImage(named: "icons8-tableware"), for: .normal)
        button2.addTarget(self, action: #selector(dinnerButton), for: .touchUpInside)
        return button2
    }()
    @objc func dinnerButton() {
      
    }
    
    lazy var buttonThree: UIButton = {
        let button3 = UIButton()
        button3.setImage(UIImage(named: "icons8-shipped"), for: .normal)
        button3.addTarget(self, action: #selector(deliveryButton), for: .touchUpInside)
        return button3
    }()
    @objc func deliveryButton() {
       
    }
    
    lazy var buttonFour: UIButton = {
        let button4 = UIButton()
        button4.setImage(UIImage(named: "icons8-dance_with_devil"), for: .normal)
        button4.addTarget(self, action: #selector(danceButton), for: .touchUpInside)
        return button4
    }()
    @objc func danceButton() {
//        delegate4?.danceButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
        setUpVenueCnstraints()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func commonInit() {
        setUpVenueCnstraints()
        //self.myCollectionView.register(VenueCell.self, forCellWithReuseIdentifier: "venuesCell")
    }
    private func setUpVenueCnstraints() {
     
        addSubview(searchBarView)
        addSubview(buttonOne)
        addSubview(buttonTwo)
        addSubview(buttonThree)
        addSubview(buttonFour)
        addSubview(mapViewKit)
        
        mapViewKit.translatesAutoresizingMaskIntoConstraints = false
        mapViewKit.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 2).isActive = true
        mapViewKit.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        mapViewKit.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -0).isActive = true
        mapViewKit.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.45).isActive = true
        
        searchBarView.translatesAutoresizingMaskIntoConstraints = false
        searchBarView.topAnchor.constraint(equalTo: mapViewKit.bottomAnchor, constant: 0).isActive = true
        searchBarView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        searchBarView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -0).isActive = true
        
       
        
        buttonOne.translatesAutoresizingMaskIntoConstraints = false
        buttonOne.topAnchor.constraint(equalTo: searchBarView.bottomAnchor, constant: 0).isActive = true
        buttonOne.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        buttonOne.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -350).isActive = true
        buttonOne.bottomAnchor.constraint(equalTo: searchBarView.bottomAnchor, constant: 30).isActive = true

        
        buttonTwo.translatesAutoresizingMaskIntoConstraints = false
        buttonTwo.topAnchor.constraint(equalTo: searchBarView.bottomAnchor).isActive = true
        buttonTwo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 33).isActive = true
        buttonTwo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -160).isActive = true
        buttonTwo.bottomAnchor.constraint(equalTo: searchBarView.bottomAnchor, constant: 30).isActive = true
        
        buttonThree.translatesAutoresizingMaskIntoConstraints = false
        buttonThree.topAnchor.constraint(equalTo: searchBarView.bottomAnchor).isActive = true
        buttonThree.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 180).isActive = true
        buttonThree.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -80).isActive = true
        buttonThree.bottomAnchor.constraint(equalTo: searchBarView.bottomAnchor, constant: 30).isActive = true
        
        buttonFour.translatesAutoresizingMaskIntoConstraints = false
        buttonFour.topAnchor.constraint(equalTo: searchBarView.bottomAnchor).isActive = true
        buttonFour.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 320).isActive = true
        buttonFour.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        buttonFour.bottomAnchor.constraint(equalTo: searchBarView.bottomAnchor, constant: 30).isActive = true

    }
}
