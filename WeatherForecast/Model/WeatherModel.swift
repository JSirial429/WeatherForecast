//
//  WeatherModel.swift
//  WeatherForecast
//
//  Created by Jorge Sirias on 12/1/25.
//

import Foundation
import SwiftData
import WeatherKit
import CoreLocation

@Model
class WeatherModel{
    let weatherService: WeatherService
    //var myLocation: CLLocation?
    var weather: Weather?
    
    init(){
        weatherService = WeatherService()
    }
    
    func getWeatherLocationData() async{
        //myLocation = CLLocation(latitude: 25.682132, longitude: -80.421799)
        weather = try! await weatherService.weather(for: CLLocation(latitude: 25.682132, longitude: -80.421799))
    }
    
    static let sampleData = [
        WeatherModel()
    ]
}

