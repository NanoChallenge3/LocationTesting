//
//  StationList.swift
//  LocationTest
//
//  Created by Nuki Venoza on 17/07/23.
//

import Foundation

class StationList: ObservableObject {
    
    @Published var stationList: [StationModel] = []
    
    let lebakBulusGrab = StationModel(id: 1, stationName: "Lebak Bulus Grab", stationLatitude: -6.2894309, stationLongitude: 106.7740249)
    let fatmawati = StationModel(id: 2, stationName: "Fatmawati", stationLatitude: -6.292444, stationLongitude: 106.7940076)
    let cipeteRaya = StationModel(id: 3, stationName: "Cipete Raya", stationLatitude: -6.2782646, stationLongitude: 106.797322)
    let hajiNawi = StationModel(id: 4, stationName: "Haji Nawi", stationLatitude: -6.2666813, stationLongitude: 106.797332)
    
    init() {
        self.stationList.append(lebakBulusGrab)
        self.stationList.append(fatmawati)
        self.stationList.append(cipeteRaya)
        self.stationList.append(hajiNawi)
    }
}
