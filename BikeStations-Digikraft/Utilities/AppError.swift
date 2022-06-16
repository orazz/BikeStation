//
//  AppError.swift
//  BikeStations-Digikraft
//
//  Created by Oraz Atakishiyev on 15.06.2022.
//

import Foundation

enum APError: Error {
    case invalidURL
    case unableToComplete
    case invalidResponse
    case invalidData
}
