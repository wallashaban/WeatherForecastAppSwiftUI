//
//  Constants.swift
//  WeatherForecastApp
//
//  Created by JETSMobileLabMini6 on 16/05/2024.
//

import Foundation

let API_KEY = "7ddc94f4335f463f826113113241605"
let BASE_URL = " http://api.weatherapi.com/v1"


func convertDateToDay(date:String) -> String{
    let dateString = date

    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"

    if let date = dateFormatter.date(from: dateString) {
        dateFormatter.dateFormat = "EEE"
        let dayOfWeekString = dateFormatter.string(from: date)
        print(dayOfWeekString)
        return dayOfWeekString
        
    } else {
        print("Invalid date format")
        return ""
    }

}

//func convertDateTimeToTime(date:String) ->String{
//    let dateString = date
//
//    let dateFormatter = DateFormatter()
//    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
//    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
//
//    if let date = dateFormatter.date(from: dateString) {
//        let formattedDateFormatter = DateFormatter()
//        formattedDateFormatter.dateFormat = "yyyy-MM-dd hh:mm a"
//        formattedDateFormatter.amSymbol = "AM"
//        formattedDateFormatter.pmSymbol = "PM"
//        formattedDateFormatter.locale = Locale(identifier: "en_US_POSIX")
//
//        let formattedDateString = formattedDateFormatter.string(from: date)
//        
//        print(formattedDateString)
//        return formattedDateString
//    } else {
//        print("Invalid date format")
//        return ""
//    }
//
//}

func convertDateTimeToTime(date:String)-> String{
    let dateString = date
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"

    if let date = dateFormatter.date(from: dateString) {
        dateFormatter.dateFormat = "h a"
        let formattedTime = dateFormatter.string(from: date)
        print(formattedTime)
        return formattedTime
    } else {
        print("Invalid date format")
        return ""
    }

}

func getCurrentTime() ->Int{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH"  // Using "HH" format specifier for 24-hour clock

    let currentTime = Date()
    let formattedTime = dateFormatter.string(from: currentTime)

    print("Current hour: \(formattedTime)")
    return Int(formattedTime) ?? 1
}
