//
//  CustomButtons.swift
//  Tasbeeh+ | تسبيح
//
//  Created by A Sky on 13/09/1446 AH.
//

import Foundation
import SwiftUI
//مجموعة من الأزرار المخصصة

/// ✅ **زر أيقوني دائري**
struct IconButton: View {
    let icon: String
    let color: Color

    var body: some View {
        Image(systemName: icon)
            .font(.title2)
            .foregroundColor(.white)
            .padding()
            .background(
                Circle()
                    .fill(color)
                    .shadow(color: color.opacity(0.5), radius: 4, x: 0, y: 2)
            )
    }
}

/// ✅ **زر دائري يستخدم للعداد**
struct CircleButtonZikr: View {
    let icon: String
    let color: Color
    let size: CGFloat

    var body: some View {
        Image(systemName: icon)
            .font(.title)
            .foregroundColor(.white)
            .frame(width: size, height: size)
            .background(
                Circle()
                    .fill(color)
                    .shadow(color: color.opacity(0.5), radius: 10)
            )
            .scaleEffect(1.0)
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.1)) {
                    UIImpactFeedbackGenerator(style: .light).impactOccurred()
                }
            }
    }
}
