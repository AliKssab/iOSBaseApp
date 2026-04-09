//
//  LocationMaster.swift
//  Captain One Driver
//
//  Created by Mohamed Akl on 19/06/2022.
//  Copyright © 2022 Mohamed Akl. All rights reserved.
//
import CoreLocation
import Combine


// MARK: - Location Permission Errors
enum LocationError: Error {
    case permissionDenied
    case noLocation
}

// MARK: - Location Model
struct LocationData {
    let latitude: Double
    let longitude: Double
    let address: String?
}

// MARK: - LocationMaster (Pro Version)
final class LocationMaster: NSObject, CLLocationManagerDelegate {
    
    // MARK: - Singleton
    static let shared = LocationMaster()
    
    // MARK: - Properties
    private let manager = CLLocationManager()
    
    @Published private(set) var lastLocation: CLLocation?
    @Published private(set) var address: String?
    
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Init
    private override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    // MARK: - Permissions
    func requestPermission() {
        switch manager.authorizationStatus {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            print("❌ Location Permission Denied")
        case .authorizedAlways, .authorizedWhenInUse:
            manager.startUpdatingLocation()
        @unknown default:
            break
        }
    }
    
    // MARK: - Fetch Location Once (async)
    func getCurrentLocation() async throws -> LocationData {
        
        // 1. تأكد من السماح
        requestPermission()
        
        // 2. انتظر أول Location
        let location = try await waitForLocation()
        
        // 3. هات العنوان
        let address = await reverseGeocode(location)
        
        // 4. رجّع البيانات
        return LocationData(
            latitude: location.coordinate.latitude,
            longitude: location.coordinate.longitude,
            address: address
        )
    }
    
    // MARK: - Await Location
    private func waitForLocation() async throws -> CLLocation {
        try await withCheckedThrowingContinuation { continuation in
            let sub = $lastLocation
                .compactMap { $0 }
                .first()
                .sink { location in
                    continuation.resume(returning: location)
                }
            
            cancellables.insert(sub)
        }
    }
    
    // MARK: - Reverse Geocoding (async)
    private func reverseGeocode(_ location: CLLocation) async -> String? {
        await withCheckedContinuation { continuation in
            CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
                if let place = placemarks?.first {
                    let street = place.thoroughfare ?? ""
                    let city = place.locality ?? ""
                    let area = place.administrativeArea ?? ""
                    continuation.resume(returning: "\(street) \(city) \(area)")
                } else {
                    continuation.resume(returning: nil)
                }
            }
        }
    }
    
    // MARK: - Delegates
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lastLocation = locations.last
    }
}
