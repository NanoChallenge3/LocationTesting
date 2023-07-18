//
//  StationModel.swift
//  LocationTest
//
//  Created by Nuki Venoza on 17/07/23.
//

import Foundation

struct StationModel: Hashable, Identifiable {
    var id: Int
    var stationName: String
    let stationLatitude: Double
    let stationLongitude: Double
    
    init(id: Int, stationName: String, stationLatitude: Double, stationLongitude: Double) {
        self.id = id
        self.stationName = stationName
        self.stationLatitude = stationLatitude
        self.stationLongitude = stationLongitude
    }
}
