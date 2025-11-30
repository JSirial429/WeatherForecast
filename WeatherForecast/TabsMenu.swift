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
                Label("Weather", systemImage: "person.and.person")
            }
            
            Text("U").tabItem {
                Label("Weather", systemImage: "person.and.person")
            }
        }
    }
}


#Preview {
    TabsMenu()
}
