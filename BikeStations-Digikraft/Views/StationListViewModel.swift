//
//  StationListViewModeel.swift
//  BikeStations-Digikraft
//
//  Created by Oraz Atakishiyev on 15.06.2022.
//

import Foundation

final class StationListViewModel: ObservableObject {
    
    @Published var items: [Feature] = []
    @Published var isLoading = false
    @Published var alertItem: AlertItem?
    
    init() {
        // This code was used in debug mode to implement UI
//        #if DEBUG
//            items = MockData.stations
//            isLoading = false
//        #endif
        getStations()
    }
    
    func getStations() {
        isLoading = true
        
        NetworkManager.shared.getBikeStations { [self] result in
            DispatchQueue.main.async {
                isLoading = false
                
                switch result {
                case .success(let items):
                    self.items = items
                    
                case .failure(let error):
                    switch error {
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                        
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                        
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
