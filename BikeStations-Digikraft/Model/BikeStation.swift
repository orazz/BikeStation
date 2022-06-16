//
//  Station.swift
//  BikeStations-Digikraft
//
//  Created by Oraz Atakishiyev on 15.06.2022.
//

import Foundation

// MARK: - BikeStation
struct BikeStation: Codable {
    var features: [Feature]
}

struct MockData {
    static let stations: [Feature] = [sampleFeature, sampleFeature, sampleFeature, sampleFeature, sampleFeature]
    
    static let sampleFeature = Feature(
        id: "15",
        geometry:
            Geometry(
                coordinates: [16.911623,52.402831]
            ),
        properties: Properties(
            freeRacks: "9",
            bikes: "14",
            label: "Poznan Glowny",
            bikeRacks: "18",
            updated: "2022-06-15 14:20"
        )
    )
}
