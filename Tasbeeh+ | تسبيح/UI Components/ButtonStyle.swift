//
//  ButtonStyle.swift
//  Tasbeeh+ | تسبيح
//
//  Created by A Sky on 13/09/1446 AH.
//

import Foundation
import SwiftUI
//أنماط الأزرار المخصصة
/// زر موحد (مضغوط) لجميع الأزرار مع حجم ثابت وتغيير ديناميكي للألوان بناءً على الثيم والإضاءة الدافئة
struct CompactButtonStyle: ButtonStyle {
    @Binding var isWarmLightOn: Bool
    var selectedTheme: Int    // نستخدم الثيم من AppColor لتغيير الألوان
    
    let fixedWidth: CGFloat = 250
    let fixedHeight: CGFloat = 40
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 16, weight: .semibold, design: .rounded))
            // نستخدم اللون الأساسي (primary) للنص، وهو يتغير حسب الثيم
            .foregroundColor(AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
            .frame(width: fixedWidth, height: fixedHeight)
            .background(
                // استخدمنا دوال AppColor لتكوين تدرج لوني ديناميكي
                LinearGradient(
                    gradient: Gradient(
                        colors: [
                            AppColor.accent(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn),
                            AppColor.secondary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn)
                        ]
                    ),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .cornerRadius(10)
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            .shadow(color: .black.opacity(0.15), radius: 3, x: 0, y: 2)
            .animation(.spring(response: 0.2, dampingFraction: 0.7), value: configuration.isPressed)
    }
}
