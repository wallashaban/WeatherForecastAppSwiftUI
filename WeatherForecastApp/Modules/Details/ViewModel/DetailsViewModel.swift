//
//  DetailsViewModel.swift
//  WeatherForecastApp
//
//  Created by JETSMobileLabMini6 on 20/05/2024.
//

import Foundation

class DetailsViewModel{
    var forecastResult : ForecastResult
    var day : Int
    init(forecastResult: ForecastResult, day : Int) {
        self.forecastResult = forecastResult
        self.day = day
    }
    
    
    func getForecastResult() -> ForecastResult{
        return self.forecastResult
    }
    
    func getHours() -> [Hour]{
        return self.forecastResult.forecast.forecastday[day].hour
    }
}
