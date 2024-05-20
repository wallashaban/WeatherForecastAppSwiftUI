//
//  ForecastRow.swift
//  WeatherForecastApp
//
//  Created by JETSMobileLabMini6 on 19/05/2024.
//

import SwiftUI
import Kingfisher

struct ForecastRow: View {
    @ObservedObject var themeManager = ThemeManager()
    var weather: Forecastday?
    var isToday = false
   
    var body: some View {
        HStack{
            Text(isToday ? "Today" : convertDateToDay(date: weather?.date ?? "")).foregroundColor(themeManager.textColor)
            KFImage(URL(string:"https:" + (weather?.day.condition.icon ?? "") ))
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .cornerRadius(10)
                            .padding()
            //Image(.cloud).resizable().frame(width: 50, height: 50).padding()
            Text("\(String(weather?.day.mintempC ?? 0.0))° - \(String(weather?.day.maxtempC ?? 0.0))°").foregroundColor(themeManager.textColor)
            Spacer()
        }.frame(height: 10).padding()
    }
}

#Preview {
    ForecastRow(weather: nil)
}
