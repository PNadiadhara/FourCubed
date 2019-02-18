//
//  SetttingLocationTableViewCell.swift
//  FourCubed
//
//  Created by Pritesh Nadiadhara on 2/12/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import UIKit

class SetttingLocationTableViewCell: UITableViewCell {
    
    lazy var enableLocationLabel : UILabel = {
        let locationLabel = UILabel()
        return locationLabel
    }()
    
    lazy var enableLocationToggle : UISwitch = {
        let locationSwitch = UISwitch()
        return locationSwitch
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "EnableLocation")
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    private func setConstraints() {
        addSubview(enableLocationLabel)
        addSubview(enableLocationToggle)
        
        enableLocationLabel.translatesAutoresizingMaskIntoConstraints = false
        enableLocationToggle.translatesAutoresizingMaskIntoConstraints = false
        
        [enableLocationLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
         enableLocationLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16)
            ].forEach{$0.isActive = true}
        
        [enableLocationToggle.centerYAnchor.constraint(equalTo: centerYAnchor),
         enableLocationToggle.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16)
         ].forEach{$0.isActive = true}
    }

}
