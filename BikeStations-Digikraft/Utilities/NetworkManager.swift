//
//  NetworkManager.swift
//  BikeStations-Digikraft
//
//  Created by Oraz Atakishiyev on 15.06.2022.
//

import UIKit

class NetworkManager: NSObject {
    
    static let shared           = NetworkManager()
    private let cache           = NSCache<NSString, UIImage>()
    
    static let baseURL          = "https://www.poznan.pl/"
    private let bikeStationsURL    = baseURL + "mim/plan/map_service.html?mtype=pub_transport&co=stacje_rowerowe"
    
    private override init() {}
    
    
    func getBikeStations(completed: @escaping (Result<[Feature], APError>) -> Void) {
        guard let url = URL(string: bikeStationsURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            if let _ =  error {
                completed(.failure(.unableToComplete))
                return
            }
                        
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(BikeStation.self, from: data)
                completed(.success(decodedResponse.features))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}
