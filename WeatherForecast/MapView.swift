//
//  MapView.swift
//  Tempus
//
//  Created by Jorge Sirias on 3/18/26.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapView: View {
    @Binding var selectedLocation: String
    @State private var cameraPosition: MapCameraPosition = .automatic
    @State private var searchResults: [MKMapItem] = [] // To store search results


    
    var body: some View {
        VStack{
            Map(position: $cameraPosition)
            .onAppear {
                geocodeCityName(selectedLocation) { coordinate in
                    if let coordinate = coordinate {
                        // Set the map's position using the obtained coordinate
                        cameraPosition = .region(MKCoordinateRegion(
                            center: coordinate,
                            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                        ))
                    }
                }
            }
            .onChange(of: selectedLocation) { oldValue, newValue in
                            // Trigger search/autocomplete as the user types
                            performSearch(query: newValue)
                        }
        }
    }
    
    func geocodeCityName(_ cityName: String, completion: @escaping (CLLocationCoordinate2D?) -> Void) {
        CLGeocoder().geocodeAddressString(cityName) { placemarks, error in
            guard let location = placemarks?.first?.location else {
                print("Geocoding error: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
                return
            }
            completion(location.coordinate)
        }
    }
    
    func performSearch(query: String) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        // Restrict the search to a relevant region if desired (e.g., current map region)
        // request.region = MKCoordinateRegion(...)
        
        let search = MKLocalSearch(request: request)
        Task {
            do {
                let response = try await search.start()
                searchResults = response.mapItems
                
                // Update the map position to the first result as the user types
                if let firstResult = response.mapItems.first {
                    let newRegion = MKCoordinateRegion(center: firstResult.placemark.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
                    withAnimation { // Use animation for a smoother transition
                        
                        cameraPosition = .region(newRegion) // Update the map camera position
                    }
                }
            } catch {
                print("Search error: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    @Previewable @State var selectedLocation: String = "Miami"
    MapView(selectedLocation: $selectedLocation)
}
