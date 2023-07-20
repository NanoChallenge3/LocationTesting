//
//  MapView.swift
//  LocationTest
//
//  Created by Nuki Venoza on 16/07/23.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapView: View {
    @StateObject private var viewModel = MapViewModel()
    
//    @StateObject private var stations = StatisonList()
    
    @State var selectedStation: StationModel = StationModel(id: 1, stationName: "Lebak Bulus Grab", stationLatitude: -6.2894309, stationLongitude: 106.7740249)
    
    @State private var distanceToStation: CLLocationDistance = 0.0
    
    var body: some View {
        VStack{
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
                .ignoresSafeArea()
                .frame(height: UIScreen.main.bounds.height/2)
                .onAppear {
                    DispatchQueue.main.async {
                        viewModel.checkIfLocationServiceIsEnabled()
                    }
                }
//                .onChange(of: selectedStation) { newValue in
//                    print(newValue.stationName)
//                    viewModel.region.center = CLLocationCoordinate2D(latitude: newValue.stationLatitude, longitude: newValue.stationLongitude)
//
//                    // Calculate and print the distance
//                    let userLocation = viewModel.locationManager?.location?.coordinate
//                    if let userLocation = userLocation {
//                        let distance = viewModel.calculateDistance(from: userLocation, to: CLLocationCoordinate2D(latitude: newValue.stationLatitude, longitude: newValue.stationLongitude))
//                        distanceToStation = distance
//                        print("Distance to \(newValue.stationName): \(distance) meters")
//
//                        if distanceToStation <= 100.0 {
//                            print("You are inside \(newValue.stationName) station")
//                        } else {
//                            print("You are far from \(newValue.stationName) station")
//                        }
//                    }
//                }
            
            Spacer()
            
            VStack {
                Spacer()
                
                Text("You are in \(viewModel.currentStation ?? "")station")
                //Picker
//                Picker("Choose a station", selection: $selectedStation) {
//                    ForEach(stations.stationList, id: \.self) { station in
//                        Text("\(station.stationName)")
//                    }
//                }
//                .pickerStyle(.inline)
//                
//                Text("Distance to \(selectedStation.stationName): \(distanceToStation, specifier: "%.2f") meters")
                                
                Spacer()
            }
        }
        
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
