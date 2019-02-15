//
//  VenueCell.swift
//  FourCubed
//
//  Created by Jose Alarcon Chacon on 2/11/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import UIKit

class VenueCell: UICollectionViewCell {
    var venueView = VenueView()
    
    lazy var imageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "placeholder"))
        image.backgroundColor = .black
        image.layer.cornerRadius = 40
        image.layer.masksToBounds = true
        return image
    }()
    
    lazy var nameOfLabel: UILabel = {
        let label = UILabel()
        label.text = "hey"
        label.textColor = .black
        label.backgroundColor = #colorLiteral(red: 0.7431213856, green: 0.9412386417, blue: 0.9332742691, alpha: 1)
        label.layer.cornerRadius = 15
        label.textAlignment = .center
        label.numberOfLines = 0
        label.layer.masksToBounds = true
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = UIColor(hue: 0.2, saturation: 0.02, brightness: 0.7, alpha: 1.0)
        commonInit()
        setConstraints()
        setLabelConstraints()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func commonInit() {
        setConstraints()
        setLabelConstraints()
    }
    private func setConstraints() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    private func setLabelConstraints() {
        addSubview(nameOfLabel)
        nameOfLabel.translatesAutoresizingMaskIntoConstraints = false
        nameOfLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5).isActive = true
        nameOfLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        nameOfLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        nameOfLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
}
