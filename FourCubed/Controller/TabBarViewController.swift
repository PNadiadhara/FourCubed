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



    override func viewDidLoad() {
        super.viewDidLoad()
        setViewControllers([mainViewController, secondViewController], animated: true)
        mainViewController.tabBarItem = UITabBarItem(title: "Search", image: UIImage(named: "search"), tag: 0)
        secondViewController.tabBarItem = UITabBarItem(title: "Favorite", image: UIImage(named: "favorite"), tag: 1)

    }
}

