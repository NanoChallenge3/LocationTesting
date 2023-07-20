//
//  MapViewModel.swift
//  LocationTest
//
//  Created by Nuki Venoza on 17/07/23.
//

import MapKit
import CoreLocation

enum MapDetails {
    static let startingLocation = CLLocationCoordinate2D(latitude: -6.2894309, longitude: 106.7740249)
    static let defaultMapSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
}

//protocol StartGetCurrentStationWithLocation {
//    var delegate: CLLocationManagerDelegate {get set}
//}

protocol MapViewModelDelegate {
    func mapManager(station: StationModel)
}

final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    var delegate: MapViewModelDelegate?
    
    @Published var region = MKCoordinateRegion(center: MapDetails.startingLocation,
                                               span: MapDetails.defaultMapSpan)
    
    var locationManager: CLLocationManager?
    
    @Published var currentStation: String?
    
    init(locationManager: CLLocationManager? = nil) {
        super.init()
        
        self.locationManager?.delegate = self
        
//        print(locationManager == nil)
        
    }
    
    func checkIfLocationServiceIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            self.locationManager = CLLocationManager()
            self.locationManager!.delegate = self
        } else {
            print("The location is turned off, please turn on the location services.")
        }
        
    }
    
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
                
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your location is restricted")
        case .denied:
            print("You have denied this app location permission. Go into settings to change it.")
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate,
                                        span: MapDetails.defaultMapSpan)

            self.locationManager?.startUpdatingLocation()

        @unknown default:
            break
        }
        
    }

    func calculateDistance(from source: CLLocationCoordinate2D, to destination: CLLocationCoordinate2D) -> CLLocationDistance {
        let sourceLocation = CLLocation(latitude: source.latitude, longitude: source.longitude)
        let destinationLocation = CLLocation(latitude: destination.latitude, longitude: destination.longitude)
        return sourceLocation.distance(from: destinationLocation)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation = locationManager?.location!.coordinate
        
        print("executed")
        
        if let userLocation = userLocation {
            
            for station in StationList.shared.stationList {
                let distance = calculateDistance(from: userLocation, to: CLLocationCoordinate2D(latitude: station.stationLatitude, longitude: station.stationLongitude))
                
                if distance <= 100.0 {
                    print("You have arrived in \(station.stationName) station")
                    currentStation = station.stationName
                    delegate?.mapManager(station: station)
                    break
                } else {
                    print("You are far from \(station.stationName) station")
                }
            }
        }
        
        
    }
    
}

