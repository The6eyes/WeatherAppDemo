//
//  Extensions.swift
//  WeatherDemo
//
//  Created by Fred Saffold on 11/17/24.
//

import Foundation
import SwiftUI

extension Double{
    func roundDouble() -> String {
        return String(format: "%.0f", self)
    }
} // round to 0 decimals

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
