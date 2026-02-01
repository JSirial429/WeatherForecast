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
            WeekForecast().tabItem {
                Label("Week Forecast", systemImage: "cloud.sun.fill")
            }
            
            UVIndexCircularProgressView().tabItem {
                Label("UV Index", systemImage: "sun.min.fill")
            }
        }
    }
}


#Preview {
    TabsMenu()
}
