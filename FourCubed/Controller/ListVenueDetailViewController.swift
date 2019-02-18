//
//  FavoriteDetailViewController.swift
//  FourCubed
//
//  Created by TingxinLi on 2/12/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import UIKit

class ListVenueDetailViewController: UIViewController {

    let searchDetailView = ListVenueDetailView()
    var listDetailData: Venue!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(searchDetailView)
       let rightButton = UIBarButtonItem(title: "Create", style: UIBarButtonItem.Style.plain, target: self, action: #selector(favoriteButtonPress))
        self.navigationItem.rightBarButtonItem = rightButton
        view.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
    }
    @objc func favoriteButtonPress() {
        
    }
}
