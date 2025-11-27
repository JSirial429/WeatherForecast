//
//  WeekForecast.swift
//  WeatherForecast
//
//  Created by Jorge Sirias on 11/27/25.
//

import SwiftUI

struct WeekForecast: View{
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                
                DayForecast(day: "Mon", isRainy: true, high: 90, low: 30)
                
                DayForecast(day: "Tue", isRainy: false, high: 95, low: 67)
                
                DayForecast(day: "Wed", isRainy: false, high: 95, low: 67)
                
                DayForecast(day: "Thu", isRainy: true, high: 95, low: 67)
                
                DayForecast(day: "Fri", isRainy: false, high: 95, low: 67)
                
                DayForecast(day: "Sat", isRainy: false, high: 95, low: 67)
                
                DayForecast(day: "Sun", isRainy: true, high: 95, low: 67)
            }
        }
    }
}

#Preview {
    WeekForecast()
}
