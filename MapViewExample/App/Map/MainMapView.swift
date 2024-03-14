//
//  MainMapView.swift
//  MapViewExample
//
//  Created by Simon Zwicker on 13.03.24.
//

import SwiftUI
import MapKit

struct MainMapView: View {
    
    // MARK: - Namespaces
    @Namespace var mapScope
    
    // MARK: - State Properties
    @State var locationManager = LocationManager()
    @State var showDetail: Bool = false
    
    // MARK: - Properties
    var detailOffset: CGFloat {
        showDetail ? 0: 350
    }
    
    // MARK: - UI Body
    var body: some View {
        ZStack {
            MainMap(scope: mapScope, locationManager: $locationManager, showDetail: $showDetail)
            
            HStack {
                MapButtons(locationManager: $locationManager, showDetail: $showDetail)
                    .padding(.top, 40.0)
                    .padding(.bottom, 30.0)
                
                Spacer()
                
                DetailView()
                    .animation(.easeInOut, value: showDetail)
                    .offset(x: detailOffset)
            }
            .padding(.vertical)
        }
        .mapScope(mapScope)
    }
}
