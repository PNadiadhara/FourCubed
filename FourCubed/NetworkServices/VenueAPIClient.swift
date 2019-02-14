//
//  VenueAPIClient.swift
//  FourCubed
//
//  Created by Pritesh Nadiadhara on 2/8/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import Foundation

final class VenueAPIClient {
    static func searchVenue(keyword: String, completionHandler: @escaping (AppError?, VenueData?) -> Void) {
        NetworkHelper.shared.performDataTask(endpointURLString: "https://api.foursquare.com/v2/venues/search?ll=40.7484,-73.9857&client_id=\(SecretKeys.ClientID)&client_secret=\(SecretKeys.APIKey)&v=20190201",  httpMethod: "GET", httpBody: nil) { (error, data, response) in
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
