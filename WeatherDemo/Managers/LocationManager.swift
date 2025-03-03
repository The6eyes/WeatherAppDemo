//
//  LocationManager.swift
//  WeatherDemo
//
//  Created by Fred Saffold on 11/16/24.
//

import Foundation
import CoreLocation
// This will allow us to manage everything related to location without running into any errors
class LocationManager: NSObject,ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestLocation() {
        isLoading = true
        manager.requestLocation()
    }
    // now we add 2 functions to make the CLLocationManagerDelegate work
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
    }
    //We need to add a function to handle errors
    func locationManager(_ manager: CLLocationManager, didFailWithError error:  Error) {
        print("Error getting location", error)
        isLoading = false
    }
}
