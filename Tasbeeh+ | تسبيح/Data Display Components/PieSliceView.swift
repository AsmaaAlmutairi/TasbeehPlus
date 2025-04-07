//
//  PieSliceView.swift
//  Tasbeeh+ | تسبيح
//
//  Created by A Sky on 13/09/1446 AH.
//
import Foundation
import SwiftUI
//يرسم كل شريحة بشكل فردي بناءً على البيانات التي يحصل عليها من PieChartView.
struct PieSliceView: View {
    var value: Double
    var color: Color
    var startAngle: Angle
    var endAngle: Angle

    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let center = CGPoint(x: geometry.size.width / 2,
                                     y: geometry.size.height / 2)
                let radius = min(geometry.size.width, geometry.size.height) / 2
                path.move(to: center)
                path.addArc(center: center, radius: radius,
                            startAngle: startAngle,
                            endAngle: endAngle, clockwise: false)
            }
            .fill(color)
        }
    }
}
