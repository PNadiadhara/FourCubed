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
        return label
    }()
    
    lazy var venueAddress : UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var venueCatagories : UILabel = {
        let label = UILabel()
        return label
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
        [venueImage.topAnchor.constraint(equalTo: topAnchor, constant: 11), venueImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11), venueImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -280),venueImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -111)].forEach{$0.isActive = true}
        
        
//        [venueImage.topAnchor.constraint(equalTo: topAnchor, constant: 11), venueImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11), venueImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -280), venueImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.04), venueImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.02)].forEach{$0.isActive = true}
        
        
        venueName.translatesAutoresizingMaskIntoConstraints = false
        [venueName.topAnchor.constraint(equalTo: topAnchor, constant: 11),
         venueName.leadingAnchor.constraint(equalTo: venueImage.trailingAnchor, constant: 11),
         venueName.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -11)
         ].forEach{$0.isActive = true}
        
        venueCatagories.translatesAutoresizingMaskIntoConstraints = false
        [venueCatagories.topAnchor.constraint(equalTo: venueName.bottomAnchor, constant: 11),
         venueCatagories.leadingAnchor.constraint(equalTo: venueImage.trailingAnchor, constant: 11),
         venueCatagories.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -11)
            ].forEach{$0.isActive = true}
        
        venueAddress.translatesAutoresizingMaskIntoConstraints = false
        [venueAddress.topAnchor.constraint(equalTo: venueCatagories.bottomAnchor, constant: 11),
         venueAddress.leadingAnchor.constraint(equalTo: venueImage.trailingAnchor, constant: 11),
         venueAddress.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -11)
            ].forEach{$0.isActive = true}
    }

}
