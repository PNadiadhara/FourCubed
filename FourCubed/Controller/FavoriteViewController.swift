//
//  FavoriteViewController.swift
//  FourCubed
//
//  Created by TingxinLi on 2/12/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {

    var favoriteView = FavoriteView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(favoriteView)
        view.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        self.favoriteView.favoriteCollectionView.register(FavoriteCollectionViewCell.self, forCellWithReuseIdentifier: "FavoriteCollectionViewCell")

    }
}
