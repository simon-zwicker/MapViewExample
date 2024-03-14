//
//  UIScreen.swift
//  MapViewExample
//
//  Created by Simon Zwicker on 14.03.24.
//

import UIKit

extension UIScreen {
    static var current: UIScreen? {
        UIWindow.current?.screen
    }
}
