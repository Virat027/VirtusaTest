//
//  RoomsDataModel.swift
//  VirtusaTest
//
//  Created by Virat on 5/17/22.
//

import Foundation
struct RoomsDataModel: Codable {
    let createdAt: String
    let isOccupied: Bool
    let maxOccupancy: Int
    let id: String
}
