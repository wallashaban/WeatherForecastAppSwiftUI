//
//  HeaderSection.swift
//  WeatherForecastApp
//
//  Created by JETSMobileLabMini6 on 19/05/2024.
//

import SwiftUI
import Kingfisher

struct HeaderSection: View {
    @ObservedObject var themeManager = ThemeManager()
    var homeViewModel : HomeViewModel?
    init( homeViewModel: HomeViewModel?) {
        self.homeViewModel = homeViewModel
    }
    var body: some View {
        Text(homeViewModel?.getWeatherForecastResult()?.location.country ?? "").font(.title)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundColor(themeManager.textColor)
        Text(String(homeViewModel?.getWeatherForecastResult()?.current.tempC ?? 0.0) + "°").font(.title)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundColor(themeManager.textColor)
        Text(homeViewModel?.getWeatherForecastResult()?.current.condition.text ?? "cloudy").font(.title2)
            .fontWeight(.regular).foregroundColor(themeManager.textColor)
        Text("H:\(String(homeViewModel?.getWeatherForecastResult()?.forecast.forecastday[0].day.maxtempC ?? 0.0))  L:\(String(homeViewModel?.getWeatherForecastResult()?.forecast.forecastday[0].day.maxtempC ?? 0.0)) ").font(.title3)
            .fontWeight(.regular).foregroundColor(themeManager.textColor)
        KFImage(URL(string:"https:" + (homeViewModel?.getWeatherForecastResult()?.current.condition.icon ?? "")))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .cornerRadius(10)
                        //.padding()
    }
}

#Preview {
    HeaderSection(homeViewModel: nil)
}
