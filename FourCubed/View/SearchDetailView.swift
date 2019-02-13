//
//  SearchDetailView.swift
//  FourCubed
//
//  Created by TingxinLi on 2/12/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import UIKit
import MapKit

class SearchDetailView: UIView {

    lazy var detailImage: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "placeholder"))
        
        
        return iv
    }()
    
    lazy var detailInfo: UITextView = {
        let textView = UITextView()
        textView.text = ""
        textView.textColor = .yellow
        textView.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        
        return textView
    }()
    
    lazy var detailMap: MKMapView = {
        let map = MKMapView()
        
        return map
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
extension SearchDetailView {
    private func setupDetail() {
        setDetailImageConstraints()
        setDetailInfoConstraints()
        setMapConstraints()
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
    func setDetailInfoConstraints() {
        addSubview(detailInfo)
        detailInfo.translatesAutoresizingMaskIntoConstraints = false
        detailInfo.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        detailInfo.topAnchor.constraint(equalTo: detailImage.bottomAnchor, constant: 5).isActive = true
        detailInfo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        detailInfo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        detailInfo.heightAnchor.constraint(equalToConstant: 100).isActive = true
        detailInfo.font = UIFont.systemFont(ofSize: 20)
    }

    func setMapConstraints() {
        addSubview(detailMap)
        detailMap.translatesAutoresizingMaskIntoConstraints = false
        detailMap.topAnchor.constraint(equalTo: detailInfo.bottomAnchor, constant: 5).isActive = true
        //detailMap.heightAnchor.constraint(lessThanOrEqualTo: heightAnchor, multiplier: 0.3).isActive = true
        detailMap.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        detailMap.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -0).isActive = true
       detailMap.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -0).isActive = true
    }
}
