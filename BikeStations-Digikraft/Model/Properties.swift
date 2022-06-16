//
//  Properties.swift
//  BikeStations-Digikraft
//
//  Created by Oraz Atakishiyev on 15.06.2022.
//

import Foundation

// MARK: - Properties
struct Properties: Codable {
    var freeRacks, bikes, label, bikeRacks: String
    var updated: String

    enum CodingKeys: String, CodingKey {
        case freeRacks = "free_racks"
        case bikes, label
        case bikeRacks = "bike_racks"
        case updated
    }
}
