//
//  Current.swift
//  WeatherForecastApp
//
//  Created by JETSMobileLabMini6 on 16/05/2024.
//

import Foundation

struct Current: Codable {
    let lastUpdatedEpoch: Double
    let lastUpdated: String
    let tempC: Double
    let tempF, isDay: Double
    let condition: Condition
    let windMph, windKph: Double
    let windDegree: Double
    let windDir: String
    let pressureMB: Double
    let pressureIn: Double
    let precipMm, precipIn, humidity, cloud: Double
    let feelslikeC, feelslikeF, visKM: Double
    let visMiles, uv: Double
    let gustMph, gustKph: Double
    let airQuality: [String: Double]

    enum CodingKeys: String, CodingKey {
        case lastUpdatedEpoch = "last_updated_epoch"
        case lastUpdated = "last_updated"
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        case condition
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case pressureMB = "pressure_mb"
        case pressureIn = "pressure_in"
        case precipMm = "precip_mm"
        case precipIn = "precip_in"
        case humidity, cloud
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
        case visKM = "vis_km"
        case visMiles = "vis_miles"
        case uv
        case gustMph = "gust_mph"
        case gustKph = "gust_kph"
        case airQuality = "air_quality"
    }
}

struct Condition: Codable {
    let text, icon: String
    let code: Double
}
