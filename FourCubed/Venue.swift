//
//  Venue.swift
//  FourCubed
//
//  Created by Pritesh Nadiadhara on 2/8/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import Foundation


struct NewVenueData : Codable {
    
    struct Response : Codable {
        let response: Dictionary<String, [newVenue]>
    }
    
    struct VenueArray : Codable {
        let venues: [newVenue]
    }
    
    struct newVenue : Codable {
        let id: String
    }
    
    let response: Response
    
}

struct VenueData : Codable {
    let response: Venues
}

struct Venues : Codable {
    let venues: [venue]
}

struct venue : Codable {
    let id: String
    let name: String
//    let location : LocationData
//    let categories : [CatagoryData]
//    let delivery : DeliveryInfo?
}

struct LocationData : Codable {
    let address : String
    let crossStreet : String
    let lat : Double
    let lng : Double
    let distance : Int
    let postalCode : String
    let city : String
    let state : String
    let counrty : String
    let formattedAddress : [String]
    let venuePage : [VenueId]?
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




/*
{
    "id": "4bcca12bb6c49c7422169491",
    "name": "86th Floor Observation Deck",
    "location": {
        "address": "350 5th Ave",
        "crossStreet": "btwn 33rd & 34th Sts",
        "lat": 40.74844544481811,
        "lng": -73.98568124187432,
        "labeledLatLngs": [
        {
        "label": "display",
        "lat": 40.74844544481811,
        "lng": -73.98568124187432
        }
        ],
        "distance": 5,
        "postalCode": "10118",
        "cc": "US",
        "city": "New York",
        "state": "NY",
        "country": "United States",
        "formattedAddress": [
        "350 5th Ave (btwn 33rd & 34th Sts)",
        "New York, NY 10118",
        "United States"
        ]
    },
    "categories": [
    {
    "id": "4bf58dd8d48988d165941735",
    "name": "Scenic Lookout",
    "pluralName": "Scenic Lookouts",
    "shortName": "Scenic Lookout",
    "icon": {
    "prefix": "https://ss3.4sqi.net/img/categories_v2/parks_outdoors/sceniclookout_",
    "suffix": ".png"
    },
    "primary": true
    }
    ],
    "venuePage": {
        "id": "64514350"
    },
    "referralId": "v-1549648816",
    "hasPerk": false
}
*/
