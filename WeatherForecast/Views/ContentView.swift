//
//  ContentView.swift
//  WeatherForecast
//
//  Created by Jorge Sirias on 9/5/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var weatherForecast: WeatherModel
    var body: some View {
        WeekForecast(weatherForecast: weatherForecast)
    }
}

#Preview {
    var weatherForecast: WeatherModel
    ContentView(weatherForecast: weatherForecast).modelContainer(SampleData.shared.modelContainer)
}
