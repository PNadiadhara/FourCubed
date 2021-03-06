//
//  Venue.swift
//  FourCubed
//
//  Created by Pritesh Nadiadhara on 2/8/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import Foundation
import CoreLocation

struct VenueData: Codable {
    let response: Venues
}
struct Venues: Codable {
    let venues: [Venue]
}

struct Venue: Codable {
    let id: String
    let name: String
    let location : LocationData?

    let categories : [CatagoryData]
    let referralId: String

   
}

struct LocationData : Codable {
    let address : String?
    let crossStreet : String?
    let lat : Double
    let lng : Double
    let distance : Int?
    let postalCode : String?
    let city : String?
    let state : String
    let country : String?
    let formattedAddress : [String]
    let venuePage : [VenueId]?
    
    public var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(lat, lng)
    }
}
struct CatagoryData : Codable {
    let name : String
}
struct VenueId : Codable {
    let id : String
}
struct DeliveryInfo : Codable {
    let url : String // this links to a food menue
    let provider :  ProviderInfo
}

struct ProviderInfo : Codable {
    let name: String
    let icon : IconInfo
}
struct IconInfo : Codable {
    let prefix : String
    let sizes : [Int]
    let name : String
    }

