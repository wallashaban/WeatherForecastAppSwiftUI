//
//  LocationManager.swift
//  WeatherForecastApp
//
//  Created by JETSMobileLabMini6 on 20/05/2024.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    private var locationManager = CLLocationManager()
        @Published var location: CLLocationCoordinate2D?
    var locationUpdateHandler: ((Double, Double) -> Void)?

    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        print("Latitude: \(latitude), Longitude: \(longitude)")
        
        locationUpdateHandler?(latitude, longitude)
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location: \(error.localizedDescription)")
    }
}

