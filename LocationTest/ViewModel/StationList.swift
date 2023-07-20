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
    let blokA = StationModel(id: 5, stationName: "Blok A", stationLatitude: -6.2557533, stationLongitude: 106.7971347)
    let blokM = StationModel(id: 6, stationName: "Blok M", stationLatitude: -6.24447, stationLongitude: 106.7981)
    let asean = StationModel(id: 7, stationName: "Asean", stationLatitude: -6.23882, stationLongitude: 106.7962013)
    let senayan = StationModel(id: 8, stationName: "Senayan", stationLatitude: -6.2263234, stationLongitude: 106.8007988)
    let istoraMandiri = StationModel(id: 9, stationName: "Istora Mandiri", stationLatitude: -6.2239386, stationLongitude: 106.8035588)
    let benhil = StationModel(id: 10, stationName: "Benhil", stationLatitude: -6.215, stationLongitude: 106.815301)
    let setiabudiAstra = StationModel(id: 11, stationName: "Setiabudi Astra", stationLatitude: -6.2088638, stationLongitude: 106.8189204)
    let dukuhAtasBNI = StationModel(id: 12, stationName: "Dukuh Atas BNI", stationLatitude: -6.2007972, stationLongitude: 106.8202212)
    let bundaranHI = StationModel(id: 13, stationName: "Bundaran HI", stationLatitude: -6.1962135, stationLongitude: 106.8210604)
    
    fileprivate init() {
        self.stationList.append(lebakBulusGrab)
        self.stationList.append(fatmawati)
        self.stationList.append(cipeteRaya)
        self.stationList.append(hajiNawi)
        self.stationList.append(blokA)
        self.stationList.append(blokM)
        self.stationList.append(asean)
        self.stationList.append(senayan)
        self.stationList.append(istoraMandiri)
        self.stationList.append(benhil)
        self.stationList.append(setiabudiAstra)
        self.stationList.append(dukuhAtasBNI)
        self.stationList.append(bundaranHI)

    }
}

extension StationList {
    static var shared: StationList = StationList()
}
