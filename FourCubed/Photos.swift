//
//  Photos.swift
//  FourCubed
//
//  Created by Pritesh Nadiadhara on 2/8/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import Foundation

struct PhotoData: Codable {
    let response: PhotoStatus
}
struct PhotoStatus: Codable {
    let photos : PhotoInfo?
}
struct PhotoInfo: Codable {
    let count: Int
    let items: [ItemDetail]
}
struct ItemDetail: Codable {
    let id: String
    let createdAt: Int
    let prefix: String
    let suffix: String

}

