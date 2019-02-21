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
    lazy var button: UIButton = {
        let detailBottun = UIButton()
        detailBottun.setImage(UIImage(named: "delete"), for: .normal)
        detailBottun.setTitleColor(.black, for: .normal)
        return detailBottun
    }()
    lazy var detailName: UILabel = {
        let label = UILabel()
        label.text = "hey"
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 0
        
        return label
    }()
    lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.text = "Address"
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    lazy var categoriesLabel: UILabel = {
        let label = UILabel()
        label.text = "Address"
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
//    override init(frame: CGRect) {
//        super.init(frame: UIScreen.main.bounds)
//        updateQuiz()
//    }
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        updateQuiz()
//    }
//    private func updateQuiz() {
//        backgroundColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 0.9303028682)
//        setupCells()
//    }
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        self.backgroundColor = .white
        addSubview(image)
        addSubview(button)
        addSubview(detailName)
        addSubview(addressLabel)
        addSubview(categoriesLabel)
        setImageConstraints()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//}
//extension FavoriteCollectionViewCell {
//    private func setupCells() {
//        setImageConstraints()
//    }

    func setImageConstraints() {
        image.translatesAutoresizingMaskIntoConstraints = false
        image.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 1).isActive = true
        image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 1).isActive = true
        image.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -1).isActive = true
        image.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        image.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -60).isActive = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: topAnchor, constant: -10).isActive = true
        button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        detailName.translatesAutoresizingMaskIntoConstraints = false
        detailName.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 1).isActive = true
        detailName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        detailName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.topAnchor.constraint(equalTo: detailName.bottomAnchor, constant: 2).isActive = true
        addressLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        addressLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        addressLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1).isActive = true
        
        categoriesLabel.translatesAutoresizingMaskIntoConstraints = false
        categoriesLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 2).isActive = true
        categoriesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        categoriesLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        categoriesLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1).isActive = true
    }
}


