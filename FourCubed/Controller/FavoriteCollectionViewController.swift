//
//  FavoriteViewController.swift
//  FourCubed
//
//  Created by TingxinLi on 2/12/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import UIKit

class FavoriteCollectionViewController: UIViewController, UIActionSheetDelegate {
    
    var venueData = [Venue]() {
        didSet {
            DispatchQueue.main.async {
                self.favoritesView.favoriteCollectionView.reloadData()
            }
        }
    }
     var listVC = ListVenueViewController()
    var array = [String]()
    let favoritesView = FavoriteView()
    var favoriteVenues = VenuesModel.getVenues()
    var saveVenues = VenuesModel.saveVenues()
    var venueCell = FavoriteCollectionViewCell()
    
     var detailData: Venue!
     var venueImages: UIImage?
     var detailOfAddress: String?
     var detailOfCategories: String?
     var detailOfCity: String?
    
    override func viewWillAppear(_ animated: Bool) {
        reload()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(favoritesView)
        favoritesView.favoriteCollectionView.dataSource = self
        favoritesView.favoriteCollectionView.delegate = self
        favoritesView.favoriteCollectionView.register(FavoriteCollectionViewCell.self, forCellWithReuseIdentifier: "FavoriteCell")
        favoritesView.favoriteCollectionView.reloadData()
        reload()
        delete()
         array = ["Restaurant", "Bar", "Shopping", "Club", "Barber/Salon", "Gym/Yoga"]
    }
    @objc func setButton(sender: UIButton) {
         let index = sender.tag
         let action = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
         let delete = UIAlertAction(title: "Delete", style: .default) { (UIAlertAction) in
            VenuesModel.delete(atIndex: index)
            self.favoritesView.favoriteCollectionView.reloadData()
            self.reload()
            self.delete()
            print("Buttonwas prewss")
        }
        action.addAction(delete)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        action.addAction(cancelAction)
        present(action, animated: true, completion: nil)
    }
    func reload() {
        favoriteVenues = VenuesModel.getVenues()
        self.favoritesView.favoriteCollectionView.reloadData()
    }
    func delete() {
        favoriteVenues = VenuesModel.getVenues()
        favoritesView.favoriteCollectionView.reloadData()
    }
}

extension FavoriteCollectionViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoriteVenues.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = favoritesView.favoriteCollectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteCell", for: indexPath) as? FavoriteCollectionViewCell else {return UICollectionViewCell()}
        cell.button.addTarget(self, action: #selector(setButton(sender:)), for: .touchUpInside)
        let favorite = favoriteVenues[indexPath.row]
        let favoriteDetail = FavoriteCollectionViewCell()

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       guard let cell = self.favoritesView.favoriteCollectionView.cellForItem(at: indexPath) as? FavoriteCollectionViewCell else {return}
        navigationController?.pushViewController(listVC, animated: true)
        
    }
}

