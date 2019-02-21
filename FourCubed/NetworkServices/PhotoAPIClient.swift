//
//  PhotoAPIClient.swift
//  FourCubed
//
//  Created by TingxinLi on 2/14/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import Foundation


final class PhotoAPIClient {
    static func searchPhoto(venueID: String, date: String,completionHandler: @escaping (AppError?, [ItemDetail]?) -> Void) {
 
        NetworkHelper.shared.performDataTask(endpointURLString: "https://api.foursquare.com/v2/venues/\(venueID)/photos?client_id=\(SecretKeys.ClientID)&client_secret=\(SecretKeys.APIKey)&v=20190201",  httpMethod: "GET", httpBody: nil) { (error, data, response) in
            if let apiCallError = error {
                print(apiCallError)
                completionHandler(AppError.badURL("URL is bad"), nil)
            }
            if let data = data {
                do {
                    let apiData = try JSONDecoder().decode(PhotoData.self, from: data)
                    completionHandler(nil, apiData.response.photos?.items)
                    
                } catch {
                    completionHandler(AppError.decodingError(error), nil)
                    
                }
            }
        }
    }
}
