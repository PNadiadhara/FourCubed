//
//  FavoriteCollectionViewCell.swift
//  FourCubed
//
//  Created by TingxinLi on 2/12/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import UIKit

protocol FavoriteViewCellDelegate: AnyObject{
    func detailButtonPress()
}

class FavoriteCollectionViewCell: UICollectionViewCell {
    var delegate: FavoriteViewCellDelegate?
    
    lazy var image: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "placeholder"))
        return iv
    }()
    lazy var button: UIButton = {
        let detailBottun = UIButton()
        detailBottun.setImage(UIImage(named: "delete"), for: .normal)
        detailBottun.addTarget(self, action: #selector(detailButtonPress), for: .touchUpInside)
        detailBottun.setTitleColor(.black, for: .normal)
        return detailBottun
    }()
    @objc func detailButtonPress() {
        delegate?.detailButtonPress()
    }
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
    }
}


