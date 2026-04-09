//
//  LocationPermissionManager.swift
//  AseerAlKotobSwiftUI
//
//  Created by Ali Mostafa on 19/11/2025.
//


import CoreLocation
import MapKit
import UIKit
import Combine
class LocationPermissionManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()

    override init() {
        super.init()
        manager.delegate = self
    }

    func requestPermission() {
        let status = manager.authorizationStatus
        
        switch status {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()

        case .denied, .restricted:
            print("⚠️ Location permission denied")

        case .authorizedWhenInUse, .authorizedAlways:
            print("✅ Already authorized")

        @unknown default:
            break
        }
    }
}

extension LocationPermissionManager {

   func openMapsRoute(to latitude: Double, longitude: Double) {
         let destination = "\(latitude),\(longitude)"

         // Google Maps
         if let googleURL = URL(string: "comgooglemaps://?daddr=\(destination)&directionsmode=driving"),
            UIApplication.shared.canOpenURL(googleURL) {

             UIApplication.shared.open(googleURL, options: [:], completionHandler: nil)
             return
         }

          openAppleMapsRoute(to: latitude, longitude: longitude)
     }
    
    func openGoogleMapsRoute(to latitude: Double, longitude: Double) {
       let destination = "\(latitude),\(longitude)"
       
        if let googleURL = URL(string: "comgooglemaps://?daddr=\(destination)&directionsmode=driving"),
          UIApplication.shared.canOpenURL(googleURL) {
           
           UIApplication.shared.open(googleURL)
           
       } else {
            openAppleMapsRoute(to: latitude, longitude: longitude)
       }
   }

   private func openAppleMapsRoute(to latitude: Double, longitude: Double) {
       let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
       
       let placemark = MKPlacemark(coordinate: coordinate)
       let mapItem = MKMapItem(placemark: placemark)
       mapItem.name = "Destination"
       
       mapItem.openInMaps(launchOptions: [
           MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving
       ])
   }
}
