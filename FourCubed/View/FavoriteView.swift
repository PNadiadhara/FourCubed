//
//  FavoriteView.swift
//  FourCubed
//
//  Created by TingxinLi on 2/12/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import UIKit



class FavoriteView: UIView {
    var venueCell = FavoriteCollectionViewCell()
    
    lazy var favoriteCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 190, height: 200)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        layout.scrollDirection = .vertical
        let CV = UICollectionView.init(frame: bounds, collectionViewLayout: layout)
        CV.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return CV
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        favoriteSetup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        favoriteSetup()
    }
    private func favoriteSetup() {
        setupFavorite()
    }
}
extension FavoriteView {
    private func setupFavorite() {
        setupQuizCollectionView()
    }
    func setupQuizCollectionView() {
        addSubview(favoriteCollectionView)
        favoriteCollectionView.translatesAutoresizingMaskIntoConstraints = false
        favoriteCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        favoriteCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        favoriteCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -0).isActive = true
        favoriteCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -0).isActive = true
    
    }
}
