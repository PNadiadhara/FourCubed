//
//  SearchDetailTableViewCell.swift
//  FourCubed
//
//  Created by Pritesh Nadiadhara on 2/13/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import UIKit

class ListVenueDetailTableViewCell: UITableViewCell {
    
    lazy var venueImage : UIImageView = {
        let image = UIImageView(image: UIImage(named: "placeholder"))
        return image
    }()
    lazy var venueName : UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    lazy var venueAddress : UILabel = {
        let address = UILabel()
        address.textColor = .black
        return address
    }()
    lazy var venueCatagories : UILabel = {
        let catagory = UILabel()
        catagory.textColor = .black
        return catagory
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor(red: 0.9686, green: 1, blue: 1, alpha: 1.0) 
        setConstraints()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setConstraints() {
        addSubview(venueImage)
        addSubview(venueName)
        addSubview(venueAddress)
        addSubview(venueCatagories)
        
        venueImage.translatesAutoresizingMaskIntoConstraints = false
        [venueImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5), venueImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10), venueImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -150),venueImage.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -1), venueImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.9), venueImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.15)].forEach{$0.isActive = true}

        venueName.translatesAutoresizingMaskIntoConstraints = false
        [venueName.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
         venueName.leadingAnchor.constraint(equalTo: venueImage.trailingAnchor, constant: 20),
         venueName.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -11),
         venueName.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50),
         venueName.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.25) ].forEach{$0.isActive = true}
        
        venueCatagories.translatesAutoresizingMaskIntoConstraints = false
        [venueCatagories.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
         venueCatagories.leadingAnchor.constraint(equalTo: venueImage.trailingAnchor, constant: 20),
         venueCatagories.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -11),
         venueCatagories.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.25) ].forEach{$0.isActive = true}
        
        venueAddress.translatesAutoresizingMaskIntoConstraints = false
        [venueAddress.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 55),
         venueAddress.leadingAnchor.constraint(equalTo: venueImage.trailingAnchor, constant: 20),
         venueAddress.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -11),
         venueAddress.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.25) ].forEach{$0.isActive = true}
    }

}
