//
//  StationMapView.swift
//  BikeStations-Digikraft
//
//  Created by Oraz Atakishiyev on 16.06.2022.
//

import SwiftUI
import MapKit

struct StationAnnotation: Identifiable {
    var coordinate: CLLocationCoordinate2D
    let freeBikes: String
    let id = UUID()
}

struct StationMapView: View {
    let freeBikes: String
    let coordinate: CLLocationCoordinate2D
    let locationAnnotation: [StationAnnotation]
    
    @State var coordinateRegion: MKCoordinateRegion
    
    init(coordinate: CLLocationCoordinate2D, freeBikes: String) {
        self.freeBikes = freeBikes
        self.coordinate = coordinate
        
        coordinateRegion = {
            var newRegion = MKCoordinateRegion()
            newRegion.center.latitude = coordinate.latitude
            newRegion.center.longitude = coordinate.longitude
            newRegion.span.latitudeDelta = 0.2
            newRegion.span.longitudeDelta = 0.2
            return newRegion
        }()
        
        locationAnnotation = [StationAnnotation(coordinate: coordinate, freeBikes: freeBikes)]
    }
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $coordinateRegion,
                showsUserLocation: true, annotationItems: locationAnnotation) {
                item in
                MapAnnotation(coordinate: item.coordinate) {
                    HStack {
                        Image("Bike")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .scaledToFit()
                            .padding(7)
                            .foregroundColor(.red)
                            .background(Color.white)
                            .clipShape(Circle())
                        
                        Text(item.freeBikes)
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(Color.green)
                    }
                }
                
            }
        }
    }
}
