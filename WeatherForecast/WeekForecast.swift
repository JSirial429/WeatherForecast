//
//  WeekForecast.swift
//  WeatherForecast
//
//  Created by Jorge Sirias on 11/27/25.
//

import SwiftUI
import SwiftData

struct WeekForecast: View{
    //@Query private var weather: WeatherModel
    //@Environment(\.modelContext) private var context
    //@Environment(WeatherModel.self) private var weather
    let daysOfTheWeek: [String] = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack{
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(daysOfTheWeek, id: \.description){
                        day in DayForecast(day: day, isRainy: true, high: 90, low: 30)
                    }
                    /*DayForecast(day: "Mon", isRainy: true, high: 90, low: 30)
                    
                    DayForecast(day: "Tue", isRainy: false, high: 95, low: 67)
                    
                    DayForecast(day: "Wed", isRainy: false, high: 95, low: 67)
                    
                    DayForecast(day: "Thu", isRainy: true, high: 95, low: 67)
                    
                    DayForecast(day: "Fri", isRainy: false, high: 95, low: 67)
                    
                    DayForecast(day: "Sat", isRainy: false, high: 95, low: 67)
                    
                    DayForecast(day: "Sun", isRainy: true, high: 95, low: 67)*/
                }
                .task {
                    //await weather.getWeatherData()
                }
                .searchable(text: $searchText)
            }
        }
    }
}

#Preview {
    WeekForecast()
        //.modelContainer(SampleData.shared.modelContainer)
        .environment(WeatherModel(lat: 25.681758, long: -80.421864))
}
