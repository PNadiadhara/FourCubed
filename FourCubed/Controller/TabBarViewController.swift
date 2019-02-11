//
//  TabBarontroller.swift
//  FourCubed
//
//  Created by Jose Alarcon Chacon on 2/9/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    var mainViewController = UINavigationController.init(rootViewController: ViewController())
    var secondViewController = UINavigationController.init(rootViewController: FavoriteCollectionViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewControllers([mainViewController, secondViewController], animated: true)
        mainViewController.tabBarItem = UITabBarItem(title: "Main Page", image: UIImage(named: "icons8-home"), tag: 0)
        secondViewController.tabBarItem = UITabBarItem(title: "Collection", image: UIImage(named: "icons8-collectibles"), tag: 0)
    }
}
