//
//  DetailView.swift
//  MapViewExample
//
//  Created by Simon Zwicker on 14.03.24.
//

import SwiftUI

struct DetailView: View {
    
    // MARK: - UI Body
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white.opacity(0.9))
                .frame(maxWidth: 250)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
    }
}
