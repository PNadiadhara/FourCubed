//
//  VenueAPIClient.swift
//  FourCubed
//
//  Created by Pritesh Nadiadhara on 2/8/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import Foundation


//final class VenueAPIClient {
//
//    static func searchVenue(search: String, completionHandler: @escaping (AppError?, [VenueData]?) -> Void) {
//
//        NetworkHelper.shared.performDataTask(endpointURLString: "https://api.foursquare.com/v2/venues/search?ll=40.7484,-73.9857&client_id=\(SecretKeys.clientID)&client_secret=\(SecretKeys.clientSecret)&v=20190201", httpMethod: "GET", httpBody: nil) { (appError, data, httpResponse) in
//            if let appError = appError {
//                completionHandler(appError, nil)
//            }
//            if let data = data {
//                do {
//                    let venueData = try JSONDecoder().decode(VenueData.self, from: data)
//                    if let response = venueData.response {
//
//                            completionHandler(nil, response)
//                    }
//
//                } catch {
//                    completionHandler(AppError.decodingError(error), nil)
//                }
//            }
//        }
//    }
//
//}
