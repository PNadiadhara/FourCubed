//
//  ViewController.swift
//  FourCubed
//
//  Created by Pritesh Nadiadhara on 2/8/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var venueView = VenueView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home Page"
        self.view.backgroundColor = .white
        view.addSubview(venueView)
       
    }
}
