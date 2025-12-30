//
//  WeekForecast.swift
//  WeatherForecast
//
//  Created by Jorge Sirias on 11/27/25.
//

import SwiftUI
import SwiftData

struct WeekForecast: View{
    var weatherForecast: WeatherModel
    @Query private var weather: WeatherModel
    @Environment(\.modelContext) private var context
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                
                DayForecast(day: "Mon", isRainy: true, high: weatherForecast.weather?.currentWeather.temperature.formatted() ?? "0", low: weatherForecast.weather?.currentWeather.temperature.formatted() ?? "0")
                
                DayForecast(day: "Tue", isRainy: false, high: weatherForecast.weather?.currentWeather.temperature.formatted() ?? "0", low: weatherForecast.weather?.currentWeather.temperature.formatted() ?? "0")
                
                DayForecast(day: "Wed", isRainy: false, high: weatherForecast.weather?.currentWeather.temperature.formatted() ?? "0", low: weatherForecast.weather?.currentWeather.temperature.formatted() ?? "0")
                
                DayForecast(day: "Thu", isRainy: true, high: weatherForecast.weather?.currentWeather.temperature.formatted() ?? "0", low: weatherForecast.weather?.currentWeather.temperature.formatted() ?? "0")
                
                DayForecast(day: "Fri", isRainy: false, high: weatherForecast.weather?.currentWeather.temperature.formatted() ?? "0", low: weatherForecast.weather?.currentWeather.temperature.formatted() ?? "0")
                
                DayForecast(day: "Sat", isRainy: false, high: weatherForecast.weather?.currentWeather.temperature.formatted() ?? "0", low: weatherForecast.weather?.currentWeather.temperature.formatted() ?? "0")
                
                DayForecast(day: "Sun", isRainy: true, high: weatherForecast.weather?.currentWeather.temperature.formatted() ?? "0", low: weatherForecast.weather?.currentWeather.temperature.formatted() ?? "0")
            }
        }
    }
}

#Preview {
    WeekForecast().modelContainer(SampleData.shared.modelContainer)
}
