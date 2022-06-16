//
//  BikeStationListView.swift
//  BikeStations-Digikraft
//
//  Created by Oraz Atakishiyev on 15.06.2022.
//

import SwiftUI

struct BikeStationListView: View {
    
    @State private var showDetail = false
    @State private var selectedStation: Feature? = nil
    @ObservedObject private var viewModel: StationListViewModel = StationListViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(alignment: .leading) {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 10) {
                            ForEach($viewModel.items, id:\.id) { item in
                                Button {
                                    selectedStation = item.wrappedValue
                                    showDetail = true
                                } label: {
                                    StationCell(feature: item.wrappedValue)
                                }.buttonStyle(.plain)
                            }
                        }
                    }
                    
                    NavigationLink(isActive: $showDetail, destination: {
                        if let selectedStation = selectedStation {
                            StationDetailsView(station: selectedStation)
                        }
                    }, label: {
                        EmptyView()
                    }).isDetailLink(false)
                }
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                .background(Color.gray.opacity(0.2))
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarColor(backgroundColor: Color.black, titleColor: .white)
                
                if viewModel.isLoading { LoadingView() }
            }.edgesIgnoringSafeArea(.bottom)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    init() {
        UITableView.appearance().backgroundColor = UIColor.gray.withAlphaComponent(0.2)
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().separatorColor = .clear
    }
}

struct BikeStationListView_Previews: PreviewProvider {
    static var previews: some View {
        BikeStationListView()
    }
}
