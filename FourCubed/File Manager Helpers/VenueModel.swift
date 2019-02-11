//
//  VenueModel.swift
//  FourCubed
//
//  Created by TingxinLi on 2/11/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import Foundation

final class VenueModel {
    private static let filename = "VenueList.plist"
    private static var venueData = [Favorite]()
    
    
    static func saveVenues() {
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename)
        do {
            let data = try PropertyListEncoder().encode(venueData)
            
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("property list encoding error: \(error)")
        }
    }
    
    
    static func getVenues() -> [Favorite] {
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename).path
        
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    venueData = try PropertyListDecoder().decode([Favorite].self, from: data)
                } catch {
                    print("property list decoding error: \(error)")
                }
            }else {
                print("getPhotoJournal - data is nil")
            }
        } else {
            print("\(filename) does not exist")
        }
        return venueData
    }
    
    static func addVenue(item: Favorite) {
        
        venueData.append(item)
        saveVenues()
    }
    
//    static func deleteVenue(atIndex index: Int) {
//        venueData.remove(at: index)
//        saveVenues()
//    }
}
