//
//  LocationManager.swift
//  MapViewExample
//
//  Created by Simon Zwicker on 14.03.24.
//

import CoreLocation
import SwiftUI
import MapKit

@Observable
class LocationManager: NSObject {
    
    enum UserCameraType {
        case follow
        case heading
        case none
        
        var icon: String {
            switch self {
            case .follow: "location.fill"
            case .none: "location"
            case .heading: "location.north.line.fill"
            }
        }
    }
    
    // MARK: - Properties
    let manager = CLLocationManager()
    var authStatus: CLAuthorizationStatus?
    var mapCamera: MapCameraPosition
    private let defaultCamera: MapCameraPosition = .camera(.init(centerCoordinate: .init(latitude: 51, longitude: 9), distance: 500_000_000))
    private var userCamera: MapCameraPosition = .camera(.init(centerCoordinate: .init(latitude: 51, longitude: 9), distance: 500_000_000))
    var userCameraType: UserCameraType = .none
    
    // MARK: - Initializer
    override init() {
        mapCamera = defaultCamera
        super.init()
        manager.delegate = self
    }
    
    // MARK: - Helpers
    private func updateCamera() {
        mapCamera = userCameraType == .none ? mapCamera: userCamera
    }
    
    func userPositionTapped() {
        switch userCameraType {
        case .follow:
            userCameraType = .heading
            userCamera = .userLocation(followsHeading: true, fallback: userCamera)
            
        case .heading:
            userCameraType = .none
            userCamera = .userLocation(followsHeading: false, fallback: userCamera)
            mapCamera = userCamera
            
        case .none:
            userCameraType = .follow
            userCamera = .userLocation(followsHeading: false, fallback: userCamera)
        }
        
        updateCamera()
    }
}

// MARK: - CLLocationManagerDelegate
extension LocationManager: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authStatus = manager.authorizationStatus
        
        switch manager.authorizationStatus {
        case .authorizedWhenInUse:
            manager.requestLocation()
            
        case .restricted, .denied:
            break
            
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
            
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        mapCamera = .userLocation(fallback: mapCamera)
        updateCamera()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("error: \(error.localizedDescription)")
    }
}

