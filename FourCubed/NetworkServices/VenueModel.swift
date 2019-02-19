//
//  VenueModel.swift
//  FourCubed
//
//  Created by TingxinLi on 2/19/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import Foundation

final class BooksModel {
    private static let filename = "VenuesList.plist"
    private static var venusData = [Favorite]()
    
    
    static func saveVenues() {
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename)
        do {
            let data = try PropertyListEncoder().encode(venusData)
            
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
                    venusData = try PropertyListDecoder().decode([Favorite].self, from: data)
                } catch {
                    print("property list decoding error: \(error)")
                }
            }else {
                print("getPhotoJournal - data is nil")
            }
        } else {
            print("\(filename) does not exist")
        }
        return venusData
    }
    
    static func addVenues(item: Favorite) {
        
        venusData.append(item)
        saveVenues()
    }
    
    static func delete(atIndex index: Int) {
        venusData.remove(at: index)
        saveVenues()
    }
}
