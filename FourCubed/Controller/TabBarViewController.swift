//
//  TabBarontroller.swift
//  FourCubed
//
//  Created by Jose Alarcon Chacon on 2/9/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    var mainViewController = UINavigationController.init(rootViewController: MainViewController())
//    var secondViewController = UINavigationController.init(rootViewController: ListViewController())
//
    var secondViewController = UINavigationController.init(rootViewController: FavoriteCollectionViewController())

   var thirdViewController = UINavigationController.init(rootViewController: SettingsViewController())

    override func viewDidLoad() {
        super.viewDidLoad()
        setViewControllers([mainViewController, secondViewController ,thirdViewController], animated: true)
        mainViewController.tabBarItem = UITabBarItem(title: "Search", image: UIImage(named: "search"), tag: 0)
        secondViewController.tabBarItem = UITabBarItem(title: "Favorite", image: UIImage(named: "favorite"), tag: 1)
        thirdViewController.tabBarItem = UITabBarItem(title: "Setting", image: UIImage(named: "settings"), tag: 2)
    }
}

