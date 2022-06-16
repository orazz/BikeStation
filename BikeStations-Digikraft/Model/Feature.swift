//
//  Feature.swift
//  BikeStations-Digikraft
//
//  Created by Oraz Atakishiyev on 15.06.2022.
//

import Foundation

// MARK: - Feature
struct Feature: Codable, Identifiable {
    var id: String
    var geometry: Geometry
    var properties: Properties
}
