//
//  VenueAPIClient.swift
//  FourCubed
//
//  Created by Pritesh Nadiadhara on 2/8/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import Foundation

final class VenueAPIClient {

    static func searchVenue(location: String, keyword: String?, date: String,completionHandler: @escaping (AppError?, [Venue]?) -> Void) {
        var endpointURLString = ""
        if let keyword = keyword {
            endpointURLString = "https://api.foursquare.com/v2/venues/search?ll=\(location.replacingOccurrences(of: " ", with: "_"))&client_id=\(SecretKeys.ClientID)&client_secret=\(SecretKeys.APIKey)&v=\(date)&query=\(keyword.replacingOccurrences(of: " ", with: "_"))&radius=2000"
        } else {
            endpointURLString = "https://api.foursquare.com/v2/venues/search?ll=\(location)&client_id=\(SecretKeys.ClientID)&client_secret=\(SecretKeys.APIKey)&v=\(date)"
        }
        NetworkHelper.shared.performDataTask(endpointURLString: endpointURLString,  httpMethod: "GET", httpBody: nil) { (error, data, response) in
            if let apiCallError = error {
                print(apiCallError)
                completionHandler(AppError.badURL("URL is bad"), nil)
            }
            if let data = data {
                do {
                    let data = try JSONDecoder().decode(VenueData.self, from: data)
                    completionHandler(nil, data.response.venues)
                } catch {
                    print("Decoding error is  \(AppError.decodingError(error)), nil)")
                    print("Error is \(error)")
                }
            }
        }
    }
    static func searchLocation(location: String, keyword: String?, date: String,completionHandler: @escaping (AppError?, [Venue]?) -> Void) {
        var endpointURLString = ""
        if let keyword = keyword {
            endpointURLString = "https://api.foursquare.com/v2/venues/search?near=\(location.replacingOccurrences(of: " ", with: "_"))&client_id=\(SecretKeys.ClientID)&client_secret=\(SecretKeys.APIKey)&v=\(date)&query=\(keyword.replacingOccurrences(of: " ", with: "_"))&radius=2500"
        } else {
            endpointURLString = "https://api.foursquare.com/v2/venues/search?near=\(location.replacingOccurrences(of: " ", with: "_"))&client_id=\(SecretKeys.ClientID)&client_secret=\(SecretKeys.APIKey)&v=\(date)"
        }
        NetworkHelper.shared.performDataTask(endpointURLString: endpointURLString,  httpMethod: "GET", httpBody: nil) { (error, data, response) in
            if let apiCallError = error {
                print(apiCallError)
                completionHandler(AppError.badURL("URL is bad"), nil)
            }
            if let data = data {
                do {
                    let data = try JSONDecoder().decode(VenueData.self, from: data)
                    completionHandler(nil, data.response.venues)
                } catch {
                    print("Decoding error is  \(AppError.decodingError(error)), nil)")
                    print("Error is \(error)")
                }
            }
        }
    }
}


