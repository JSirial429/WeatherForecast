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
        if isSearchBarVisible{
            NavigationStack{
                VStack {
                    HStack(){
                        Text("City Placeholder")
                        Spacer()
                    }
                    .padding(10)
                    .border(Color.red)
                }
                .padding(.bottom, 200)
                .border(Color.blue)
                
                VStack{
                    ScrollView(.horizontal, showsIndicators: true){
                        HStack{
                            ForEach(daysOfTheWeek, id: \.description){
                                day in NavigationLink(destination: Text("This is a test")){
                                    DayForecast(day: day, isRainy: true, high: 90, low: 30)
                                }
                            }
                        }
                        .task {
                            //await weather.getWeatherData()
                        }
                    }
                }
                .padding(20)
                .border(.red)
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
                Spacer()
            }
            .searchable(text: $searchText, prompt: "Search Location")
        }else{
            NavigationStack{
                VStack {
                    HStack(){
                        Text("City Placeholder")
                        Spacer()
                    }
                    .padding(10)
                    .border(Color.red)
                }
                .padding(.bottom, 200)
                .border(Color.blue)
                
                VStack{
                    ScrollView(.horizontal, showsIndicators: true){
                        HStack{
                            ForEach(daysOfTheWeek, id: \.description){
                                day in NavigationLink(destination: Text("This is a test")){
                                    DayForecast(day: day, isRainy: true, high: 90, low: 30)
                                }
                            }
                        }
                        .task {
                            //await weather.getWeatherData()
                        }
                    }
                }
                .padding(20)
                .border(.red)
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
                Spacer()
            }
        }
        
    }
}

#Preview {
    WeekForecast()
        //.modelContainer(SampleData.shared.modelContainer)
        .environment(WeatherModel(lat: 25.681758, long: -80.421864))
}
