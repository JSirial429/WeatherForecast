//
//  DayForecast.swift
//  WeatherForecast
//
//  Created by Jorge Sirias on 11/27/25.
//

import SwiftUI
/Users/jorgesirias/Desktop/MDC North Fall 2025/Projects/WeatherForecast/WeatherForecast/Views/DayForecast.swift
struct DayForecast: View {
    let day: String
    let isRainy: Bool
    let high: String
    let low: String
    
    var iconName: String{
        if isRainy{
            return "cloud.rain.fill"
        }else{
            return "sun.max.fill"
        }
    }
    
    var iconColor: Color{
        if isRainy{
            return Color.blue
        }else{
            return Color.yellow
        }
    }
    
    var body: some View {
        VStack {
            Text(day)
                .font(Font.headline)
            
            Image(systemName: iconName)
                .foregroundStyle(iconColor)
                .font(Font.largeTitle)
                .padding(5)
            
            Text("\(high)")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            
            Text("\(low)")
                .fontWeight(.regular)
                .foregroundStyle(Color.secondary)
            
        }
        .padding()
    }
}

#Preview {
    DayForecast(day: "Mon", isRainy: true, high: "98", low: "79")
}
