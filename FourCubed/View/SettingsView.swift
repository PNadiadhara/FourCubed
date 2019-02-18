//
//  SettingsView.swift
//  FourCubed
//
//  Created by Pritesh Nadiadhara on 2/12/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import UIKit

class SettingsView: UIView {

    lazy var myTableView : UITableView = {
        let tableview = UITableView()
        //TODO : FIGURE OUT HOW TO SET TABLEVIEW CONTENT TO STATIC CELLS
        
        return tableview
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        addSubview(myTableView)
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        
        [myTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
         myTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
         myTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
         myTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
         ].forEach{$0.isActive = true}
        
    }
    
}
