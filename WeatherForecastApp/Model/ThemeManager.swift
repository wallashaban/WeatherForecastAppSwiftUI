//
//  ThemeManager.swift
//  WeatherForecastApp
//
//  Created by JETSMobileLabMini6 on 20/05/2024.
//

import Foundation

import SwiftUI

enum Theme {
    case light
    case dark
}

class ThemeManager: ObservableObject {
    @Published var currentTheme: Theme = .light
    
    var textColor: Color {
        return currentTheme == .light ? .black : .white
    }
    
    init() {
           updateThemeBasedOnTime()
       }
       
       private func updateThemeBasedOnTime() {
           let date = Date()
           let calendar = Calendar.current
           let hour = calendar.component(.hour, from: date)
           
           if getCurrentTime() >= 8 && hour < 20 {
               currentTheme = .light
           } else {
               currentTheme = .dark
           }
       }
}
