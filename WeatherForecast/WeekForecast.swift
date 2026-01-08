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
    @State private var isSearchBarVisible = false
    
    var body: some View {
        NavigationStack{
            VStack{
                if isSearchBarVisible{
                    //Call Custom View of Search Bar
                    ZStack{
                        SearchBar(searchText: searchText)
                        ScrollView(.horizontal, showsIndicators: true){
                            HStack{
                                ForEach(daysOfTheWeek, id: \.description){
                                    day in DayForecast(day: day, isRainy: true, high: 90, low: 30, isSearchBarVisible: $isSearchBarVisible)
                                }
                            }
                            .task {
                                //await weather.getWeatherData()
                            }
                        }
                    }
                }else{
                    ScrollView(.horizontal, showsIndicators: true){
                        HStack{
                            ForEach(daysOfTheWeek, id: \.description){
                                day in DayForecast(day: day, isRainy: true, high: 90, low: 30, isSearchBarVisible: $isSearchBarVisible)
                            }
                        }
                        .task {
                            //await weather.getWeatherData()
                        }
                    }
                }
            }
            .toolbar{
                ToolbarItem{
                    if isSearchBarVisible{
                        Button("End"){
                            withAnimation(.easeInOut(duration: 0.5)){
                                isSearchBarVisible.toggle()
                            }
                        }
                    }else{
                        Button(action: {
                            withAnimation(.easeInOut(duration: 0.5)){
                                isSearchBarVisible.toggle()
                            }
                        }, label: {
                            Image(systemName:"magnifyingglass")
                        })
                    }
                }
            }
        }
    }
}

#Preview {
    WeekForecast()
        //.modelContainer(SampleData.shared.modelContainer)
        .environment(WeatherModel(lat: 25.681758, long: -80.421864))
}
