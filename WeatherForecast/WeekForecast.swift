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
            VStack {
                HStack(){
                    Text(isSearchBarVisible ? " " : "City Placeholder")
                    Spacer()
                }
                .padding(10)
                .border(Color.red)
            }
            .padding(.bottom, 150)
            .border(Color.blue)
            .ignoresSafeArea(.keyboard)
            
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
            //.padding(20)
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
        .modifier(SearchBarView(searchText: $searchText, isActive: $isSearchBarVisible))
        
    }
}

struct SearchBarView: ViewModifier{
    @Binding var searchText: String
    @Binding var isActive: Bool
    
    func body(content: Content) -> some View {
        if isActive{
            content
                .searchable(text: $searchText, prompt: "Search Place")
        }else{
            content
        }
    }
}

#Preview {
    WeekForecast()
        //.modelContainer(SampleData.shared.modelContainer)
        .environment(WeatherModel(lat: 25.681758, long: -80.421864))
}
