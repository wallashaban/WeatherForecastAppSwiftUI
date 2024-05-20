//
//  HomeViewModel.swift
//  WeatherForecastApp
//
//  Created by JETSMobileLabMini6 on 19/05/2024.
//

import Foundation

class HomeViewModel{
    var forecastResult:ForecastResult?
    var data: [GridData]!
    func getData(lat: Double, long:Double,complitionHandler: @escaping () -> Void){
        RemoteDataSource().fetchData(lat: lat, long: long) {result, error in
            self.forecastResult = result
           complitionHandler()
            print("Result : \(String(describing: result))")
            print("Count : \(String(describing: self.forecastResult?.forecast.forecastday.count))")
            }
        }
    
    func getWeatherForecastResult()-> ForecastResult?{
        return forecastResult
    }
    
    
    func getGridData() -> [GridData]{
        data = [GridData(name: "Humadity", value: "\(String(Int(self.forecastResult?.current.humidity ?? 0.0 ))) %"),
                GridData(name: "Visibility", value: "\(String(Int(self.forecastResult?.current.visKM ?? 0.0 ))) KM"),
                GridData(name: "FeelsLike", value: "\(String(Int(self.forecastResult?.current.feelslikeC ?? 0.0 )))°"),
                GridData(name: "Pressure", value: "\(String(Int(self.forecastResult?.current.pressureMB ?? 0.0 )))")]
        return data
    }
}
