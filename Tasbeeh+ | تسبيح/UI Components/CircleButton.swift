//
//  CircleButton.swift
//  Tasbeeh+ | تسبيح
//
//  Created by A Sky on 13/09/1446 AH.
//

import Foundation
import SwiftUI
// زر دائري
// هيكل الزر الدائري في ملف منفصل (مثلاً CircleButton.swift)
struct CircleButton: View {
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
    }
}
