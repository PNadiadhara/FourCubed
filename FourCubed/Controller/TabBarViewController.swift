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
    //var secondViewController = UINavigationController.init(rootViewController: FavoriteViewController())
   var thirdViewController = UINavigationController.init(rootViewController: SettingsViewController())
   // var thirdViewController = UINavigationController.init(rootViewController: SearchDetailViewController())

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewControllers([mainViewController, secondViewController, thirdViewController], animated: true)
        mainViewController.tabBarItem = UITabBarItem(title: "Main Page", image: UIImage(named: "icons8-home"), tag: 0)
        secondViewController.tabBarItem = UITabBarItem(title: "Collection", image: UIImage(named: "icons8-collectibles"), tag: 1)
        thirdViewController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(named: "settings-icon"), tag: 2)

    }
}
