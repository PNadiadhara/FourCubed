//
//  ListView.swift
//  FourCubed
//
//  Created by Jose Alarcon Chacon on 2/11/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import UIKit

class ListVenueView: UIView {
    
    lazy var tableViewList: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    lazy var dismissButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        
        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        addSubview(tableViewList)
        commonInit()
        setupTableView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func commonInit() {
        setupTableView()
    }
    private func setupTableView() {
        tableViewList.translatesAutoresizingMaskIntoConstraints = false
        tableViewList.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableViewList.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        tableViewList.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -0).isActive = true
        tableViewList.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
}
