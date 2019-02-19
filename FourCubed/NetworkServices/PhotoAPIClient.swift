//
//  PhotoAPIClient.swift
//  FourCubed
//
//  Created by TingxinLi on 2/14/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import Foundation

final class PhotoAPIClient {
    static func searchPhoto(venueID: String, date: String,completionHandler: @escaping (AppError?, VenueData?) -> Void) {
        NetworkHelper.shared.performDataTask(endpointURLString: "https://api.foursquare.com/v2/venues/4bcca12bb6c49c7422169491/photos?v=\(venueID)&client_id=\(SecretKeys.ClientID)&client_secret=\(SecretKeys.APIKey)&v=\(date)",  httpMethod: "GET", httpBody: nil) { (error, data, response) in
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
