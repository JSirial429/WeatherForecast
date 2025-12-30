//
//  WeatherModel.swift
//  WeatherForecast
//
//  Created by Jorge Sirias on 12/11/25.
//

import Foundation
import WeatherKit
import CoreLocation
import SwiftData

@Observable
class WeatherModel{
    let weatherService: WeatherService
    var location: CLLocation
    var weatherData: Weather! = nil
    
    init(lat: Double, long: Double){
        weatherService =  WeatherService()
        location = CLLocation(latitude: CLLocationDegrees(lat), longitude: CLLocationDegrees(long))
    }
    
    func getWeatherData() async{
        weatherData = try! await weatherService.weather(for: location)
    }
    
    //static let sampleData = WeatherModel(lat: 25.681758, long: -80.421864)
}
