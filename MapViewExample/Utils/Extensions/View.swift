//
//  View.swift
//  MapViewExample
//
//  Created by Simon Zwicker on 14.03.24.
//

import SwiftUI

extension View {
    
    // MARK: - Modifiers
    func button(action: @escaping () -> Void) -> some View {
        modifier(ButtonWrapper(action: action))
    }
}
