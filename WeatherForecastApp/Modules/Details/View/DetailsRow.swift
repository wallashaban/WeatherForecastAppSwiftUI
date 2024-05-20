//
//  DetailsRow.swift
//  WeatherForecastApp
//
//  Created by JETSMobileLabMini6 on 19/05/2024.
//

import SwiftUI
import Kingfisher

struct DetailsRow: View {
    @ObservedObject var themeManager = ThemeManager()
    var weather: Hour?
    
    var body: some View {
        HStack{
            Text(convertDateTimeToTime(date: weather?.time ?? "")).font(.title).padding().foregroundColor(themeManager.textColor)
            KFImage(URL(string:"https:" + (weather?.condition.icon ?? "") ))
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .cornerRadius(10)
                            .padding()
            Text("\(Int(weather?.tempC ?? 0.0))°").font(.title).padding().foregroundColor(themeManager.textColor)
            Spacer()
        }.frame(height: 10).padding()
    }
}

#Preview {
    DetailsRow(weather: nil)
}
