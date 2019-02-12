//
//  FavoriteCollectionViewCell.swift
//  FourCubed
//
//  Created by TingxinLi on 2/12/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import UIKit

class FavoriteCollectionViewCell: UICollectionViewCell {
    lazy var image: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "placeholder"))
        
        
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        updateQuiz()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        updateQuiz()
    }
    
    private func updateQuiz() {
        backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        setupCells()
    }
    
}
extension FavoriteCollectionViewCell {
    private func setupCells() {
        
        setImageConstraints()
        
    }
    func setImageConstraints() {
        addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        image.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        image.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
    }
}


