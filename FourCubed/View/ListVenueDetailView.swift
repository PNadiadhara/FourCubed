//
//  SearchDetailView.swift
//  FourCubed
//
//  Created by TingxinLi on 2/12/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import UIKit


class ListVenueDetailView: UIView {
    
    lazy var detailImage: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "placeholder"))
        return iv
    }()
    
    lazy var detailName: UILabel = {
        let label = UILabel()
        label.text = "hey"
        label.textAlignment = .center
        label.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.6369385148, blue: 0.9214410186, alpha: 1)
        label.numberOfLines = 0
        
        return label
    }()
    lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.text = "Address"
        label.textColor = .black
        label.layer.borderWidth = 2
        label.layer.borderColor = #colorLiteral(red: 1, green: 0.7235265962, blue: 0.9147313784, alpha: 1)
        label.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        return label
    }()
    
    lazy var categoriesLabel: UILabel = {
        let label = UILabel()
        label.text = "Address"
        label.textColor = .black
        label.layer.borderWidth = 2
        label.layer.borderColor = #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)
        label.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        return label
    }()
    lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.text = "Address"
        label.textColor = .black
        label.layer.borderWidth = 2
        label.layer.borderColor = #colorLiteral(red: 1, green: 0.7235265962, blue: 0.4739984274, alpha: 1)
        label.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        return label
    }()
    
    lazy var mapButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.8321695924, green: 0.985483706, blue: 0.4733308554, alpha: 1)
        button.layer.borderWidth = 4
        button.layer.borderColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        button.setTitle("Map", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    
    
override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        updateSearchDeatilData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        updateSearchDeatilData()
    }
    
    private func updateSearchDeatilData() {
        backgroundColor = #colorLiteral(red: 0.6424551916, green: 0.7585406124, blue: 0.7210985528, alpha: 1)
        setupDetail()
    }
}
extension ListVenueDetailView {
    private func setupDetail() {
        setDetailImageConstraints()
        setDetailNameConstraints()
        setAddressLabel()
        setCrossStreetLabel()
        setCityLabel()
        setMapButton()
    }

    func setDetailImageConstraints() {
        addSubview(detailImage)
        detailImage.translatesAutoresizingMaskIntoConstraints = false
        detailImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
       // detailImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        detailImage.heightAnchor.constraint(lessThanOrEqualTo: heightAnchor, multiplier: 0.35).isActive = true
        detailImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        detailImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -0).isActive = true
    }
    func setDetailNameConstraints() {
        addSubview(detailName)
        detailName.translatesAutoresizingMaskIntoConstraints = false
       // detailName.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        detailName.topAnchor.constraint(equalTo: detailImage.bottomAnchor, constant: 11).isActive = true
        detailName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        detailName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        detailName.font = UIFont.boldSystemFont(ofSize: 20.0)
    }
    func setAddressLabel() {
        addSubview(addressLabel)
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.topAnchor.constraint(equalTo: detailName.bottomAnchor, constant: 5).isActive = true
        addressLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        addressLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        addressLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.08).isActive = true
        addressLabel.font = UIFont.systemFont(ofSize: 15)
    }
    
    func setCrossStreetLabel() {
        addSubview(categoriesLabel)
        categoriesLabel.translatesAutoresizingMaskIntoConstraints = false
        categoriesLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 5).isActive = true
        categoriesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        categoriesLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        categoriesLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.08).isActive = true
        categoriesLabel.font = UIFont.systemFont(ofSize: 15)
    }
    
    func setCityLabel() {
        addSubview(cityLabel)
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.topAnchor.constraint(equalTo: categoriesLabel.bottomAnchor, constant: 5).isActive = true
        cityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        cityLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        cityLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.08).isActive = true
        cityLabel.font = UIFont.systemFont(ofSize: 15)
    }
    
    func setMapButton() {
        addSubview(mapButton)
        mapButton.translatesAutoresizingMaskIntoConstraints = false
        mapButton.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 10).isActive = true
        mapButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive = true
        mapButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50).isActive = true
    }
    
}
