//
//  TabBarController.swift
//  FourCubed
//
//  Created by TingxinLi on 2/11/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let firstVC = FirstViewController()
        firstVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(named: "search"), tag: 0)
        
        let favoritesViewController = FavoriteViewController()
        favoritesViewController.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(named: "favorite"), tag: 1)
        
        let settingsViewController = SettingViewController()
        settingsViewController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(named: "setting"), tag: 2)
        
        
        let tabBarList = [UINavigationController(rootViewController: firstVC),
                          UINavigationController(rootViewController: favoritesViewController),
                          UINavigationController(rootViewController: settingsViewController)]
        
        viewControllers = tabBarList
        
        
    }
    


}
