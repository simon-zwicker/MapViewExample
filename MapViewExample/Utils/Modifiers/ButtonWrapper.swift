//
//  ButtonWrapper.swift
//  MapViewExample
//
//  Created by Simon Zwicker on 14.03.24.
//

import SwiftUI

struct ButtonWrapper: ViewModifier {
    
    // MARK: - Properties
    var action: () -> Void
    
    // MARK: - Helpers
    func body(content: Content) -> some View {
        Button { action() } label: { content }
    }
}
