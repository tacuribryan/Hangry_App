//
//  UserCurrentLocation.swift
//  Hangry
//
//  Created by Bryan Tacuri on 5/11/23.
//

import Foundation
import CoreLocation
import MapKit
import UIKit


final class ContentViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    @Published var currentAddress : String?
    @Published var currentLocation: CLLocation?
    @Published var isLoadingLocation = false
    
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func requestAllowOnceLocationPermission() {
        isLoadingLocation = true
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latestLocation = locations.first else {
            //show error
            return
        }
        
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(latestLocation) { placemarks, error in
            if let error =  error {
                print(error.localizedDescription)
                return
            }
            guard let placemark = placemarks?.first else {
                //show error
                return
            }
            
            // Extract the address components from the placemark
                    var addressComponents = [String]()
                    if let name = placemark.name {
                        addressComponents.append(name)
                    }
//                    if let thoroughfare = placemark.thoroughfare {
//                        addressComponents.append(thoroughfare)
//                    }
                    if let locality = placemark.locality {
                        addressComponents.append(locality)
                    }
                    if let administrativeArea = placemark.administrativeArea {
                        addressComponents.append(administrativeArea)
                    }
                    if let postalCode = placemark.postalCode {
                        addressComponents.append(postalCode)
                    }

                    self.currentAddress = addressComponents.joined(separator: " ")
        }
        
        
//        DispatchQueue.main.async {
//            self.region = MKCoordinateRegion(center: latestLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
//        }
        isLoadingLocation = false
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location manager failed with error: \(error.localizedDescription)")
        isLoadingLocation = false
    }
}
