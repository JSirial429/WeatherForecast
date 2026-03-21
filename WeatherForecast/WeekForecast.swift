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
    let gradientAppBackground: [Color] = [.clearSkiesGradientTop, .clearSkiesGradientBottom]
    let daysOfTheWeek: [String] = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    @State private var searchLocation = ""
    @State private var isSearchBarVisible = false
    @State private var performSearch = false
    
    var body: some View {        
        NavigationStack{
            if isSearchBarVisible{
                MapView(selectedLocation: $searchLocation, performSearch: $performSearch, isSearchBarVisible: $isSearchBarVisible)
            }else{
                VStack{
                    VStack {
                        HStack(){
                            Text(searchLocation)
                                .font(.largeTitle.bold())
                                .fontDesign(Font.Design.rounded)
                                .foregroundStyle(Color.white)
                            Spacer()
                        }
                        .padding(10)
                        //.border(Color.red)
                    }
                    .padding(.bottom, 120)
                    //.border(Color.blue)
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
                    //.border(.red)
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
                                        .foregroundStyle(Color.white)
                                })
                            }
                        }
                    }
                    Spacer()
                }
                //.background(Color.blue.opacity(0.1))
                .background(Gradient(colors: gradientAppBackground))
            }
        }
        //.modifier(SearchBarView(searchText: $searchLocation, isActive: $isSearchBarVisible))
        /*.onSubmit(of: .search) {
            performSearch.toggle()
        }*/
        
    }
}

struct SearchBarView: ViewModifier{
    @Binding var searchText: String
    @Binding var isActive: Bool
    
    func body(content: Content) -> some View {
        if isActive{
            content
                .searchable(text: $searchText, prompt: "Search Location")
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
