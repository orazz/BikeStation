//
//  StationCell.swift
//  BikeStations-Digikraft
//
//  Created by Oraz Atakishiyev on 15.06.2022.
//

import SwiftUI

struct StationCell: View {
    
    let feature: Feature
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .leading, spacing: 0) {
                Text(feature.properties.label)
                    .font(.title)
                    .fontWeight(.bold)
                Text("Bike station")
                    .font(.callout)
            }.padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            
            HStack {
                Spacer()
                VStack(spacing: 10) {
                    Image("Bike")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .scaledToFit()
                    Text("Available bikes")
                        .font(.body)
                        .foregroundColor(Color.gray)
                    Text(feature.properties.bikes)
                        .font(.system(size: 75, weight: .bold))
                        .foregroundColor(.green)
                }
                Spacer()
                VStack(spacing: 10) {
                    Image("Lock")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .scaledToFit()
                    Text("Available places")
                        .font(.body)
                        .foregroundColor(Color.gray)
                    Text(feature.properties.freeRacks)
                        .font(.system(size: 75, weight: .bold))
                }
                Spacer()
            }
            
        }.padding(10)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .background(Color.white)
            .cornerRadius(8)
            .edgesIgnoringSafeArea(.all)
    }
}

struct StationCell_Previews: PreviewProvider {
    static var previews: some View {
        StationCell(feature: MockData.sampleFeature)
            .previewLayout(.sizeThatFits)
        
    }
}
