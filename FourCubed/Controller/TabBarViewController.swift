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
    var secondViewController = UINavigationController.init(rootViewController: ListViewController())
    var lastViewController = UINavigationController.init(rootViewController: FavoriteCollectionViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewControllers([mainViewController, secondViewController ,lastViewController], animated: true)
        mainViewController.tabBarItem = UITabBarItem(title: "Main Page", image: UIImage(named: "icons8-home"), tag: 0)
        secondViewController.tabBarItem = UITabBarItem(title: "List", image: UIImage(named: "icons8-transaction_list_filled"), tag: 0)
        lastViewController.tabBarItem = UITabBarItem(title: "Collection", image: UIImage(named: "icons8-collectibles"), tag: 0)
    }
}
