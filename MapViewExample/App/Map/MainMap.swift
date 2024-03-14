//
//  MainMap.swift
//  MapViewExample
//
//  Created by Simon Zwicker on 14.03.24.
//

import SwiftUI
import MapKit

struct MainMap: View {
    
    // MARK: - Properties
    var scope: Namespace.ID?
    
    var mapTrailingInset: CGFloat {
        showDetail ? 175: 0
    }
    
    var mapTopInset: CGFloat {
        self.locationManager.userCameraType == .heading ? 250: 0
    }
    
    // MARK: - Binding Properties
    @Binding var locationManager: LocationManager
    @Binding var showDetail: Bool
    
    var body: some View {
        Map(
            position: $locationManager.mapCamera,
            interactionModes: locationManager.userCameraType == .heading ? [.zoom]: [.all],
            scope: scope
        ) {
            UserAnnotation()
        }
        .mapControls {
            MapCompass(scope: scope)
                .mapControlVisibility(.hidden)
        }
        .mapStyle(.hybrid)
        .contentMargins(.trailing, mapTrailingInset)
        .contentMargins(.top, mapTopInset)
    }
}
