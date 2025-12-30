//
//  ContentView.swift
//  WeatherForecast
//
//  Created by Jorge Sirias on 9/5/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabsMenu()
    }
}

#Preview {
    ContentView()
        //.modelContainer(SampleData.shared.modelContainer)
        .environment(WeatherModel(lat: 25.681758, long: -80.421864))
}
