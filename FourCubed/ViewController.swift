//
//  ViewController.swift
//  FourCubed
//
//  Created by Pritesh Nadiadhara on 2/8/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var testing = [venues]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        VenueAPIClient.searchVenue(search: "") { (appError, data) in
            if let appError = appError {
                print(appError.errorMessage)
            } else if let search = data {
                self.testing = search
            }
        }
        print()
    }


}

