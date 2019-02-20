//
//  FavoriteView.swift
//  FourCubed
//
//  Created by TingxinLi on 2/12/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import UIKit

class FavoriteView: UIView {

    lazy var favoriteCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 180, height: 300)
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
        
        
        favoriteCollectionView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.9).isActive = true
        favoriteCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        favoriteCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        
    }
    
    

}
