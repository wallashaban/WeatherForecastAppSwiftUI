//
//  ForecastResult.swift
//  WeatherForecastApp
//
//  Created by JETSMobileLabMini6 on 16/05/2024.
//

import Foundation


struct ForecastResult : Codable {
    let location: Location
    let current: Current
    let forecast: Forecast
}


