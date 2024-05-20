//
//  DetailsScreen.swift
//  WeatherForecastApp
//
//  Created by JETSMobileLabMini6 on 19/05/2024.
//

import SwiftUI

    struct DetailsScreen: View {
        @ObservedObject var themeManager = ThemeManager()
        var detailsViewModel : DetailsViewModel?
        var isToday = false
        var body: some View {
            ZStack{
                if themeManager.currentTheme == .dark{
                    Image(.night)
                }else{
                    Image(.day)
                }
                
                ScrollView{
                    VStack{
                        Text("").padding(.top,100)
                        ForEach(Array((detailsViewModel?.getHours().enumerated())!), id: \.element.time) { index, hour in
                           
                            if(isToday && index > getCurrentTime()){
                                DetailsRow(weather: hour).padding()
                            }else if (!isToday){
                                DetailsRow(weather: hour).padding()
                            }
                        }
                        Text("").padding(.bottom,100)
                    }
                    
                }
            }
        }
    }

#Preview {
    DetailsScreen()
}
