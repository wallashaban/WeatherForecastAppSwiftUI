//
//  Location.swift
//  WeatherForecastApp
//
//  Created by JETSMobileLabMini6 on 16/05/2024.
//

import Foundation



struct Location : Codable {
    let name, region, country: String
    let lat, lon: Double
    let tzID: String
    let localtimeEpoch: Double
    let localtime: String

    enum CodingKeys: String, CodingKey {
        case name, region, country, lat, lon
        case tzID = "tz_id"
        case localtimeEpoch = "localtime_epoch"
        case localtime
    }
}



