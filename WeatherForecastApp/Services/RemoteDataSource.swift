//
//  RemoteDataSource.swift
//  WeatherForecastApp
//
//  Created by JETSMobileLabMini6 on 16/05/2024.
//

import Foundation
import Alamofire

protocol IRemoteDataSource{
    mutating func fetchData(lat: Double,long:Double ,complitionHandler: @escaping (ForecastResult?, Error?) -> Void)
}

class RemoteDataSource: IRemoteDataSource {
    
    
    func fetchData(lat: Double,long:Double , complitionHandler: @escaping (ForecastResult?, Error?) -> Void) {
        let url = //"https://api.weatherapi.com/v1/forecast.json?key=7ddc94f4335f463f826113113241605&q=30.0715495,31.0215953&days=3&aqi=yes&alerts=no"
        "https://api.weatherapi.com/v1/forecast.json?key=7ddc94f4335f463f826113113241605&q=\(lat),\(long)%2015953&days=3&aqi=yes&alerts=no"
        AF.request(url).responseJSON{
            response in
            if let data = response.data{
                do{
                    let json = try JSONDecoder().decode(ForecastResult.self, from: data)
                    print("Data : \(json)")
                    complitionHandler(json, nil)
                }catch let error{
                    print("Error in remote data source")
                    print(error)
                    complitionHandler(nil, error)
                }
            }
            else{
                print("No Data")
                complitionHandler(nil, responseError.noDataError)
            }
            
        }
    }
    enum responseError : Error{
        case noDataError
    }
}
