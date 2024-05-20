//
//  HomeScreen.swift
//  WeatherForecastApp
//
//  Created by JETSMobileLabMini6 on 20/05/2024.
//

import SwiftUI

struct HomeScreen: View {
    @ObservedObject var themeManager = ThemeManager()
    @StateObject var locationManager = LocationManager()
    var homeViewModel = HomeViewModel()
    @State  var isRecieved = false

    var body: some View {
        NavigationView{
        ZStack{
            if themeManager.currentTheme == .dark{
                Image(.night)
            }else{
                Image(.day)
            }
            ScrollView{
                Spacer()
                if isRecieved {
                    VStack{
                        Text("").padding()
                        HeaderSection(homeViewModel: homeViewModel)
                        ScrollView{
                            VStack{
                                Text("3-Day Forecast").padding(.trailing,170).foregroundColor(themeManager.textColor)
                                Divider().frame(height: 1).background(Color.black)
                                NavigationLink(destination: DetailsScreen(detailsViewModel: DetailsViewModel(forecastResult: homeViewModel.getWeatherForecastResult()!, day: 0), isToday: true)){
                                        ForecastRow(weather: homeViewModel.getWeatherForecastResult()?.forecast
                                            .forecastday[0],isToday: true)
                                    }
                                Divider().frame(height: 1).background(Color.black)
                                NavigationLink(destination: DetailsScreen(detailsViewModel: DetailsViewModel(forecastResult: homeViewModel.getWeatherForecastResult()!, day: 1))){
                                        
                                        ForecastRow(weather: homeViewModel.getWeatherForecastResult()?.forecast
                                            .forecastday[1])
                                    }
                                Divider().frame(height: 1).background(Color.black)
                                NavigationLink(destination: DetailsScreen(detailsViewModel: DetailsViewModel(forecastResult: homeViewModel.getWeatherForecastResult()!, day: 2))){
                                        
                                        ForecastRow(weather: homeViewModel.getWeatherForecastResult()?.forecast
                                            .forecastday[2])
                                    }
                            }.padding(.leading,35).padding(.trailing,35)
                            
                        }

                        ForecastDetailsGrid(homeViewModel: homeViewModel
                        )
                    }.padding()
                }
            }.onAppear{
                locationManager.locationUpdateHandler = { latitude, longitude in
                    print("Received location update. Latitude: \(latitude), Longitude: \(longitude)")
                    homeViewModel.getData(lat: latitude, long: longitude) {
                        self.isRecieved = true
                    }
                }
                
            }.scrollContentBackground(.hidden).background(Color.clear)
                
            }
        }
    }
}

#Preview {
    HomeScreen()
}
