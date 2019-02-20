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
        button1.setImage(UIImage(named: "duck"), for: .normal)
        button1.addTarget(self, action: #selector(barButton), for: .touchUpInside)
       // button1.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        return button1
    }()
    @objc func barButton(){
        
    }
    
    lazy var buttonTwo: UIButton = {
        let button2 = UIButton()
        button2.setImage(UIImage(named: "cat"), for: .normal)
        button2.addTarget(self, action: #selector(dinnerButton), for: .touchUpInside)
        //button2.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        return button2
    }()
    @objc func dinnerButton() {
      
    }
    
    lazy var buttonThree: UIButton = {
        let button3 = UIButton()
        button3.setImage(UIImage(named: "dog"), for: .normal)
        button3.addTarget(self, action: #selector(deliveryButton), for: .touchUpInside)
        button3.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        return button3
    }()
    @objc func deliveryButton() {
       
    }
    
    lazy var buttonFour: UIButton = {
        let button4 = UIButton()
        button4.setImage(UIImage(named: "cyclist"), for: .normal)
        button4.addTarget(self, action: #selector(danceButton), for: .touchUpInside)
        button4.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
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
        
       
        
//        buttonOne.translatesAutoresizingMaskIntoConstraints = false
//        buttonOne.topAnchor.constraint(equalTo: searchBarView.bottomAnchor, constant: 0).isActive = true
//        buttonOne.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
//        buttonOne.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -350).isActive = true
//        buttonOne.bottomAnchor.constraint(equalTo: searchBarView.bottomAnchor, constant: 30).isActive = true
//
//
//        buttonTwo.translatesAutoresizingMaskIntoConstraints = false
//        buttonTwo.topAnchor.constraint(equalTo: searchBarView.bottomAnchor).isActive = true
//        buttonTwo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 33).isActive = true
//        buttonTwo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -160).isActive = true
//        buttonTwo.bottomAnchor.constraint(equalTo: searchBarView.bottomAnchor, constant: 30).isActive = true
//
//        buttonThree.translatesAutoresizingMaskIntoConstraints = false
//        buttonThree.topAnchor.constraint(equalTo: searchBarView.bottomAnchor).isActive = true
//        buttonThree.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 180).isActive = true
//        buttonThree.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -80).isActive = true
//        buttonThree.bottomAnchor.constraint(equalTo: searchBarView.bottomAnchor, constant: 30).isActive = true
//
//        buttonFour.translatesAutoresizingMaskIntoConstraints = false
//        buttonFour.topAnchor.constraint(equalTo: searchBarView.bottomAnchor).isActive = true
//        buttonFour.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 320).isActive = true
//        buttonFour.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
//        buttonFour.bottomAnchor.constraint(equalTo: searchBarView.bottomAnchor, constant: 30).isActive = true
//
        buttonOne.translatesAutoresizingMaskIntoConstraints = false
        buttonOne.topAnchor.constraint(equalTo: searchBarView.bottomAnchor, constant: 0).isActive = true
        buttonOne.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
       // buttonOne.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -350).isActive = true
        //buttonOne.bottomAnchor.constraint(equalTo: searchBarView.bottomAnchor, constant: 30).isActive = true
        buttonOne.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 10).isActive = true
        buttonOne.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 10).isActive = true
        
        buttonTwo.translatesAutoresizingMaskIntoConstraints = false
        buttonTwo.topAnchor.constraint(equalTo: searchBarView.bottomAnchor, constant: 0).isActive = true
        //buttonTwo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        buttonTwo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
       // buttonTwo.bottomAnchor.constraint(equalTo: searchBarView.bottomAnchor, constant: 30).isActive = true
        buttonTwo.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 10).isActive = true
        buttonTwo.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 10).isActive = true
        
//        buttonThree.translatesAutoresizingMaskIntoConstraints = false
//        buttonThree.topAnchor.constraint(equalTo: buttonOne.bottomAnchor, constant: 0).isActive = true
//        buttonThree.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
//        //buttonThree.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -80).isActive = true
//        buttonThree.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -0).isActive = true
//
//        buttonFour.translatesAutoresizingMaskIntoConstraints = false
//        buttonFour.topAnchor.constraint(equalTo: buttonTwo.bottomAnchor, constant: 0).isActive = true
//        buttonFour.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
//        buttonFour.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
//        buttonFour.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -0).isActive = true
        


    }
}
