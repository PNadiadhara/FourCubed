//
//  VenueAPIClient.swift
//  FourCubed
//
//  Created by Pritesh Nadiadhara on 2/8/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import Foundation

final class VenueAPIClient {
    static func searchVenue(location: String, keyword: String?, date: String,completionHandler: @escaping (AppError?, VenueData?) -> Void) {
        
        var endpointURLString = ""
        if let keyword = keyword {
            endpointURLString = "https://api.foursquare.com/v2/venues/search?ll=\(location)&client_id=\(SecretKeys.ClientID)&client_secret=\(SecretKeys.APIKey)&v=\(date)&query=\(keyword)"
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
                    print("Data is \(data)")
                } catch {
                    print("Decoding error is  \(AppError.decodingError(error)), nil)")
                    print("Error is \(error)")
                }
            }
        }
    }
}
