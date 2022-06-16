//
//  StationDetailsView.swift
//  BikeStations-Digikraft
//
//  Created by Oraz Atakishiyev on 16.06.2022.
//

import SwiftUI
import MapKit

struct StationDetailsView: View {
    
    let station: Feature
    
    init(station: Feature) {
        self.station = station
    }
    
    var body: some View {
        let coordinates = CLLocationCoordinate2D(
            latitude: station.geometry.coordinates[1],
            longitude: station.geometry.coordinates[0])
        GeometryReader { geometry in
            VStack {
                ZStack(alignment: .top) {
                    StationMapView(coordinate: coordinates, freeBikes: station.properties.bikes)
                        .frame(height: geometry.size.height * 0.70, alignment: .top)
                    VStack {
                        Spacer()
                        VStack {
                            StationCell(feature: self.station)
                        }
                        .frame(height: geometry.size.height * 0.35, alignment: .bottom)
                        .padding(EdgeInsets(top: 15, leading: 10, bottom: 10, trailing: 10))
                    }
                    .edgesIgnoringSafeArea(.all)
                    
                }
                
            }
            .navigationTitle(station.properties.label.capitalized)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarColor(backgroundColor: Color.black, titleColor: .white)
        }
    }
}

struct StationDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        StationDetailsView(station: MockData.sampleFeature)
    }
}
