//
//  SampleData.swift
//  WeatherForecast
//
//  Created by Jorge Sirias on 11/27/25.
//

import Foundation
import SwiftData

@MainActor
class SampleData{
    /*static let shared = SampleData()
    
    let modelContainer: ModelContainer
    
    var context: ModelContext{
        modelContainer.mainContext
    }
    
    private init(){
        let schema = Schema(
            [WeatherModel.self]
        )
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        
        do{
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            insertSampleData()
            try context.save()
        }catch{
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    private func insertSampleData(){
        context.insert(WeatherModel.sampleData)
    }*/
}
