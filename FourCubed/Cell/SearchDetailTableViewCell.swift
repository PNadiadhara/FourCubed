//
//  SearchDetailTableViewCell.swift
//  FourCubed
//
//  Created by Pritesh Nadiadhara on 2/13/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import UIKit

class SearchDetailTableViewCell: UITableViewCell {
    
    lazy var venueImage : UIImage = {
        let image = UIImage()
        return image
    }()
    lazy var venueLabel : UILabel = {
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
        addSubview(venueLabel)
        
        venueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        [venueLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
         venueLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16)
         ].forEach{$0.isActive = true}
        
        
    }

}
