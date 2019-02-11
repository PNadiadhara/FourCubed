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
    var venueCell = VenueCell()
    
    lazy var myCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 240, height: 280)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor(hue: 0.2, saturation: 0.02, brightness: 0.9, alpha: 1.0)
        return collectionView
    }()
    lazy var mapViewKit: MKMapView = {
        let mapView = MKMapView()
        return mapView
    }()
    lazy var searchBarView: UISearchBar = {
        let searchBar = UISearchBar()
        return searchBar
    }()
    lazy var viewDetail: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hue: 0.2, saturation: 0.02, brightness: 0.8, alpha: 1.0)
        return view
    }()
    lazy var buttonOne: UIButton = {
        let button1 = UIButton()
        button1.setImage(UIImage(named: "icons8-champagne_filled"), for: .normal)
        return button1
    }()
    lazy var buttonTwo: UIButton = {
        let button2 = UIButton()
        button2.setImage(UIImage(named: "icons8-tableware"), for: .normal)
        return button2
    }()
    lazy var buttonTwoThree: UIButton = {
        let button3 = UIButton()
        button3.setImage(UIImage(named: "icons8-shipped"), for: .normal)
        return button3
    }()
    lazy var buttonTwoFour: UIButton = {
        let button4 = UIButton()
        button4.setImage(UIImage(named: "icons8-dance_with_devil"), for: .normal)
        return button4
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        addSubview(mapViewKit)
        addSubview(viewDetail)
        addSubview(searchBarView)
        addSubview(buttonOne)
        addSubview(buttonTwo)
        addSubview(buttonTwoThree)
        addSubview(buttonTwoFour)
        addSubview(myCollectionView)
        commonInit()
        setUpVenueCnstraints()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func commonInit() {
        setUpVenueCnstraints()
        self.myCollectionView.register(VenueCell.self, forCellWithReuseIdentifier: "venuesCell")
    }
    private func setUpVenueCnstraints() {
        myCollectionView.translatesAutoresizingMaskIntoConstraints = false
        myCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 450).isActive = true
        myCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        myCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        myCollectionView.heightAnchor.constraint(equalTo: heightAnchor, constant: -550).isActive = true
        
        mapViewKit.translatesAutoresizingMaskIntoConstraints = false
        mapViewKit.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 2).isActive = true
        mapViewKit.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        mapViewKit.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -0).isActive = true
        mapViewKit.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.38).isActive = true
        
        searchBarView.translatesAutoresizingMaskIntoConstraints = false
        searchBarView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 350).isActive = true
        searchBarView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        searchBarView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -0).isActive = true
        
        viewDetail.translatesAutoresizingMaskIntoConstraints = false
        viewDetail.topAnchor.constraint(equalTo:searchBarView.bottomAnchor).isActive = true
        viewDetail.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        viewDetail.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -0).isActive = true
        viewDetail.bottomAnchor.constraint(equalTo: myCollectionView.topAnchor).isActive = true
        
        buttonOne.translatesAutoresizingMaskIntoConstraints = false
        buttonOne.topAnchor.constraint(equalTo: searchBarView.bottomAnchor).isActive = true
        buttonOne.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        buttonOne.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -350).isActive = true
        buttonOne.bottomAnchor.constraint(equalTo: myCollectionView.topAnchor).isActive = true
        
        buttonTwo.translatesAutoresizingMaskIntoConstraints = false
        buttonTwo.topAnchor.constraint(equalTo: searchBarView.bottomAnchor).isActive = true
        buttonTwo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 33).isActive = true
        buttonTwo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -160).isActive = true
        buttonTwo.bottomAnchor.constraint(equalTo: myCollectionView.topAnchor).isActive = true
        
        buttonTwoThree.translatesAutoresizingMaskIntoConstraints = false
        buttonTwoThree.topAnchor.constraint(equalTo: searchBarView.bottomAnchor).isActive = true
        buttonTwoThree.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 180).isActive = true
        buttonTwoThree.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -80).isActive = true
        buttonTwoThree.bottomAnchor.constraint(equalTo: myCollectionView.topAnchor).isActive = true
        
        buttonTwoFour.translatesAutoresizingMaskIntoConstraints = false
        buttonTwoFour.topAnchor.constraint(equalTo: searchBarView.bottomAnchor).isActive = true
        buttonTwoFour.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 320).isActive = true
        buttonTwoFour.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        buttonTwoFour.bottomAnchor.constraint(equalTo: myCollectionView.topAnchor).isActive = true
    }
}
