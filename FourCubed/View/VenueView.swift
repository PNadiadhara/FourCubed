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
        button1.contentMode = .scaleAspectFit
        button1.setImage(UIImage(named: "Restaurant"), for: .normal)
        button1.layer.borderWidth = 4
        button1.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        return button1
    }()
    
    
    lazy var buttonTwo: UIButton = {
        let button2 = UIButton()
        button2.setImage(UIImage(named: "Bar"), for: .normal)
        button2.layer.borderWidth = 4
        button2.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return button2
    }()
    
    
    lazy var buttonThree: UIButton = {
        let button3 = UIButton()
        button3.setImage(UIImage(named: "Shopping"), for: .normal)
        button3.layer.borderWidth = 4
        button3.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return button3
    }()
  
    
    lazy var buttonFour: UIButton = {
        let button4 = UIButton()
        button4.setImage(UIImage(named: "Club"), for: .normal)
        button4.layer.borderWidth = 4
        button4.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        return button4
    }()
  
    
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
        addSubview(mapViewKit)
        addSubview(searchBarView)
        addSubview(buttonOne)
        addSubview(buttonTwo)
        addSubview(buttonThree)
        addSubview(buttonFour)
        
        
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
        buttonOne.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 170).isActive = true
        buttonOne.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -75).isActive = true
        buttonOne.heightAnchor.constraint(equalToConstant: 120).isActive = true
        buttonOne.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        buttonTwo.translatesAutoresizingMaskIntoConstraints = false
        buttonTwo.heightAnchor.constraint(equalToConstant: 120).isActive = true
        buttonTwo.widthAnchor.constraint(equalToConstant: 120).isActive = true
        buttonTwo.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 300).isActive = true
        buttonTwo.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -75).isActive = true
        
        
        buttonThree.translatesAutoresizingMaskIntoConstraints = false
        buttonThree.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 170).isActive = true
        buttonThree.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 75).isActive = true
        buttonThree.heightAnchor.constraint(equalToConstant: 120).isActive = true
        buttonThree.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        buttonFour.translatesAutoresizingMaskIntoConstraints = false
        buttonFour.heightAnchor.constraint(equalToConstant: 120).isActive = true
        buttonFour.widthAnchor.constraint(equalToConstant: 120).isActive = true
        buttonFour.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 300).isActive = true
        buttonFour.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 75).isActive = true


    }
}
