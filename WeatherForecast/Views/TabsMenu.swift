//
//  TabsMenu.swift
//  WeatherForecast
//
//  Created by Jorge Sirias on 11/29/25.
//

import SwiftUI

struct TabsMenu: View {
    var body: some View {
        TabView {
            WeekForecast(weatherForecast: <#WeatherModel#>).tabItem {
                Label("Weather", systemImage: "thermometer.medium")
            }
            
            Text("U").tabItem {
                Label("UV", systemImage: "sun.min.fill")
            }
        }
    }
}


#Preview {
    TabsMenu()
}
