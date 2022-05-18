//
//  APIConstants.swift
//  VirtusaTest
//
//  Created by Virat on 5/16/22.
//

import Foundation
internal struct APIPaths {
    static let baseURL      = "https://61e947967bc0550017bc61bf.mockapi.io/api/v1/"
    static let people       = "people"
    static let rooms        = "rooms"
    
}

enum ScreenType: String {
    case people = "People"
    case room = "Rooms"
    
}
