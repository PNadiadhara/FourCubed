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
    var mapTableViewAndCollectionView = MapTableAndCollectionView()
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .black
        return image
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = UIColor(hue: 0.2, saturation: 0.02, brightness: 0.7, alpha: 1.0)
        commonInit()
        setConstraints()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func commonInit() {
        setConstraints()
    }
    private func setConstraints() {
        addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
}
