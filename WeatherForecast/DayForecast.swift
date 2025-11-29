//
//  DayForecast.swift
//  WeatherForecast
//
//  Created by Jorge Sirias on 11/27/25.
//

import SwiftUI

struct DayForecast: View {
    let day: String
    let isRainy: Bool
    let high: Int
    let low: Int
    
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
    DayForecast(day: "Mon", isRainy: true, high: 93, low: 83)
}
