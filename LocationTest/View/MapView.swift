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
    
    @StateObject private var stations = StationList()
    
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
                .onChange(of: selectedStation) { newValue in
                    print(newValue.stationName)
                    viewModel.region.center = CLLocationCoordinate2D(latitude: newValue.stationLatitude, longitude: newValue.stationLongitude)
                    
//                    switch newValue.id {
//                    case 1:
//                        print("Lebak Bulus Grab")
//
//                        viewModel.region.center = CLLocationCoordinate2D(latitude: newValue.stationLatitude, longitude: newValue.stationLongitude)
//
//                    case 2:
//                        print("Fatmawati")
//
//                        viewModel.region.center = CLLocationCoordinate2D(latitude: newValue.stationLatitude, longitude: newValue.stationLongitude)
//
//                    case 3:
//                        print("Cipete Raya")
//
//                        viewModel.region.center = CLLocationCoordinate2D(latitude: newValue.stationLatitude, longitude: newValue.stationLongitude)
//
//                    case 4:
//                        print("Haji Nawi")
//
//                        viewModel.region.center = CLLocationCoordinate2D(latitude: newValue.stationLatitude, longitude: newValue.stationLongitude)
//
//                    default:
//                        break
//                    }
                    
                    // Calculate and print the distance
                    let userLocation = viewModel.locationManager?.location?.coordinate
                    if let userLocation = userLocation {
                        let distance = viewModel.calculateDistance(from: userLocation, to: CLLocationCoordinate2D(latitude: newValue.stationLatitude, longitude: newValue.stationLongitude))
                        distanceToStation = distance
                        print("Distance to \(newValue.stationName): \(distance) meters")
                    }
                }
            
            Spacer()
            
            VStack {
                Spacer()
                
                //Picker
                Picker("Choose a station", selection: $selectedStation) {
                    ForEach(stations.stationList, id: \.self) { station in
                        Text("\(station.stationName)")
                    }
                }
                .pickerStyle(.inline)
                
                Text("Distance to \(selectedStation.stationName): \(distanceToStation, specifier: "%.2f") meters")
                                
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
