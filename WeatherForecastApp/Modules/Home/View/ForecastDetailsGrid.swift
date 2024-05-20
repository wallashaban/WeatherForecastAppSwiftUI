//
//  ForecastDetailsGrid.swift
//  WeatherForecastApp
//
//  Created by JETSMobileLabMini6 on 19/05/2024.
//

import SwiftUI
struct GridData: Hashable {
    var name: String
    var value: String
}

struct ForecastDetailsGrid: View {
    @ObservedObject var themeManager = ThemeManager()
    var homeViewModel : HomeViewModel?
    init(homeViewModel : HomeViewModel?){
        self.homeViewModel = homeViewModel
    }

       let columns = [
           GridItem(.flexible()),
           GridItem(.flexible()),
       ]
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(homeViewModel!.getGridData(), id: \.self) { item in
                           VStack{
                               Text(item.name).padding(EdgeInsets(top: 6, leading: 0, bottom: 3, trailing: 0)).foregroundColor(themeManager.textColor)
                               
                               Text(item.value).font(.title).foregroundColor(themeManager.textColor)
                           }
                               .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
                               .background(Color.clear)
                               .padding(5)
                               .foregroundColor(.black)
                       }
                   }
                   .padding()
    }
}

#Preview {
    ForecastDetailsGrid(homeViewModel: nil)
}
