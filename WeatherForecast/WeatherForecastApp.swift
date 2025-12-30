//
//  WeatherForecastApp.swift
//  WeatherForecast
//
//  Created by Jorge Sirias on 9/5/25.
//

import SwiftUI

@main
struct WeatherForecastApp: App {
    @State private var Weather = WeatherModel(lat: 25.681758, long: -80.421864)
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(Weather)
        }
    }
}
