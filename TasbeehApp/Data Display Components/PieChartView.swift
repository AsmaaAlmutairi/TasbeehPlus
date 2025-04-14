//
//  PieChartView.swift
//  Tasbeeh+ | تسبيح
//
//  Created by A Sky on 13/09/1446 AH.
//

import Foundation
import SwiftUI
import Charts
//عرض الإحصائيات في مخطط دائري.
/// ✅ **عرض المخطط الدائري للإحصائيات**
struct PieChartView: View {
    var data: [Double]
    var labels: [String]
    var colors: [Color]

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0..<data.count, id: \.self) { index in
                    PieSliceView(
                        value: data[index],
                        color: colors[index],
                        startAngle: self.startAngle(at: index),
                        endAngle: self.endAngle(at: index)
                    )
                }
            }
        }
    }

    private func total() -> Double {
        return data.reduce(0, +)
    }

    private func startAngle(at index: Int) -> Angle {
        let sum = data.prefix(index).reduce(0, +)
        return .degrees((sum / total()) * 360)
    }

    private func endAngle(at index: Int) -> Angle {
        let sum = data.prefix(index + 1).reduce(0, +)
        return .degrees((sum / total()) * 360)
    }
}
