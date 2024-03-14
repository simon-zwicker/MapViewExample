//
//  MapButtons.swift
//  MapViewExample
//
//  Created by Simon Zwicker on 14.03.24.
//

import SwiftUI

struct MapButtons: View {
    
    // MARK: - Binding Properties
    @Binding var locationManager: LocationManager
    @Binding var showDetail: Bool
    
    // MARK: - UI Body
    var body: some View {
        VStack(alignment: .leading) {
            
            Image(systemName: locationManager.userCameraType.icon)
                .font(.system(size: 16.0, weight: .medium))
                .frame(width: 20, height: 20)
                .padding(10.0)
                .foregroundStyle(locationManager.userCameraType == .none ? .blue: .white)
                .background(locationManager.userCameraType == .none ? .white: .blue)
                .clipShape(.rect(cornerRadius: 5.0))
                .button {
                    locationManager.userPositionTapped()
                }
            
            Image(systemName: "info.circle")
                .font(.system(size: 16.0, weight: .medium))
                .frame(width: 20, height: 20)
                .padding(10.0)
                .background(showDetail ? .blue: .white)
                .foregroundStyle(showDetail ? .white: .blue)
                .clipShape(.rect(cornerRadius: 5.0))
                .button {
                    showDetail.toggle()
                }
            
            Spacer()
            
            HStack {
                Image(systemName: "plus")
                    .font(.system(size: 16.0, weight: .medium))
                    .frame(width: 20, height: 20)
                    .padding(10.0)
                    .background(.white)
                    .clipShape(.rect(cornerRadius: 5.0))
                    .button {
                        print("Add Marker")
                    }
                
                Image(systemName: "minus")
                    .font(.system(size: 16.0, weight: .medium))
                    .frame(width: 20, height: 20)
                    .padding(10.0)
                    .background(.white)
                    .clipShape(.rect(cornerRadius: 5.0))
                    .button {
                        print("Remove Marker")
                    }
            }
        }
    }
}
