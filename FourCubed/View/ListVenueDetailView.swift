//
//  SearchDetailView.swift
//  FourCubed
//
//  Created by TingxinLi on 2/12/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import UIKit


class ListVenueDetailView: UIView {
    
    lazy var detailImage: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "placeholder"))
        return iv
    }()
    
    lazy var detailName: UILabel = {
        let label = UILabel()
        label.text = "hey"
        label.textAlignment = .center
        label.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        
        return label
    }()
    
    lazy var detailInfo: UITextView = {
        let textView = UITextView()
        textView.text = "Whats up"
        textView.textColor = .yellow
        textView.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        updateSearchDeatilData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        updateSearchDeatilData()
    }
    
    private func updateSearchDeatilData() {
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        setupDetail()
    }
}
extension ListVenueDetailView {
    private func setupDetail() {
        setDetailImageConstraints()
        setDetailNameConstraints()
        setDetailInfoConstraints()
    }

    func setDetailImageConstraints() {
        addSubview(detailImage)
        detailImage.translatesAutoresizingMaskIntoConstraints = false
        detailImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        detailImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        detailImage.heightAnchor.constraint(lessThanOrEqualTo: heightAnchor, multiplier: 0.35).isActive = true
        detailImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        detailImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -0).isActive = true
    }
    func setDetailNameConstraints() {
        addSubview(detailName)
        detailName.translatesAutoresizingMaskIntoConstraints = false
        detailName.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        detailName.topAnchor.constraint(equalTo: detailImage.bottomAnchor, constant: 15).isActive = true
        detailName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        detailName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        //detailName.heightAnchor.constraint(equalToConstant: 100).isActive = true
        detailName.font = UIFont.boldSystemFont(ofSize: 20.0)
    }

    func setDetailInfoConstraints() {
        addSubview(detailInfo)
        detailInfo.translatesAutoresizingMaskIntoConstraints = false
        detailInfo.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        detailInfo.topAnchor.constraint(equalTo: detailName.bottomAnchor, constant: 10).isActive = true
        detailInfo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        detailInfo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        detailInfo.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        detailInfo.font = UIFont.systemFont(ofSize: 20)
        
    }
}
