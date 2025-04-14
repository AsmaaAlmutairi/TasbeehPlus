//
//  ZikrCardView.swift
//  Tasbeeh+ | تسبيح
//
//  Created by A Sky on 13/09/1446 AH.
//

import Foundation
/*import Foundation
import SwiftUI

struct ZikrCardView: View {
    var zikr: Zikr
    var selectedTheme: Int
    var isWarmLightOn: Bool
    var onComplete: () -> Void
    var onShare: () -> Void
    
    @State private var completedRepetitions: Int = 0
    
    var body: some View {
        VStack(spacing: 15) {
            Text(zikr.text)
                .font(.system(size: 18, weight: .medium))
                .multilineTextAlignment(.trailing)
                .lineSpacing(8)
                .padding()
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(AppColor.background(
                            forTheme: selectedTheme,
                            isWarmLightOn: isWarmLightOn
                        ).opacity(0.3))
                )
            
            if let virtue = zikr.virtue, !virtue.isEmpty {
                Text(virtue)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .padding(.horizontal)
            }
            
            HStack {
                Spacer()
                
                Button(action: onShare) {
                    Image(systemName: "square.and.arrow.up")
                        .font(.system(size: 20))
                        .padding(8)
                        .background(Circle().fill(Color.gray.opacity(0.2)))
                }
                
                Button(action: {
                    UIPasteboard.general.string = zikr.text
                }) {
                    Image(systemName: "doc.on.doc")
                        .font(.system(size: 18))
                        .padding(8)
                        .background(Circle().fill(Color.gray.opacity(0.2)))
                }
            }
            .padding(.horizontal)
            
            CounterView( // ✅ التصحيح هنا
                current: $completedRepetitions,
                total: zikr.repetition,
                color: AppColor.accent(
                    forTheme: selectedTheme,
                    isWarmLightOn: isWarmLightOn
                ), onComplete: <#() -> Void#>
            )
            .padding()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(AppColor.background(
                    forTheme: selectedTheme,
                    isWarmLightOn: isWarmLightOn
                ))
                .shadow(radius: 5)
        )
        .padding(.horizontal, 10)
    }
}*/
import SwiftUI
// عنصر يعرض ذكرًا معينًا.
struct ZikrCardView: View {
    var zikr: Zikr
    var selectedTheme: Int
    var isWarmLightOn: Bool
    var onComplete: () -> Void
    var onShare: () -> Void

    @State private var completedRepetitions: Int = 0

    var body: some View {
        VStack(spacing: 10) {
            Text(zikr.text)
                .font(.system(size: 18, weight: .medium)) // الحجم الافتراضي
                .minimumScaleFactor(0.5) // تقليل الحجم إلى 50٪ إذا لزم الأمر
                .lineLimit(nil) // السماح بعدد غير محدود من الأسطر
                .multilineTextAlignment(.center)
                .lineSpacing(6)
                .padding(.horizontal, 15)
                .foregroundColor(AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))

            if let virtue = zikr.virtue, !virtue.isEmpty {
                Text(virtue)
                    .font(.system(size: 14))
                    .foregroundColor(AppColor.secondary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                    .padding(.top, 7)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 22)
                .fill(AppColor.background(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                .shadow(radius: 5)
        )
        .padding(.horizontal, 12)
    }
}

/*
// ✅ تعريف CounterView في نفس الملف (يجب أن يكون مرة واحدة فقط في المشروع)
struct CounterView: View {
    @Binding var current: Int
    let total: Int
    let color: Color
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 3)
                .foregroundColor(color.opacity(0.3))
            
            Circle()
                .trim(from: 0, to: CGFloat(current) / CGFloat(total))
                .stroke(color, style: StrokeStyle(lineWidth: 4, lineCap: .round))
                .rotationEffect(.degrees(-90))
            
            Text("\(current)/\(total)")
                .font(.system(size: 12, weight: .bold, design: .monospaced))
                .foregroundColor(color)
        }
        .frame(width: 40, height: 40)
        .onTapGesture {
            withAnimation {
                if current < total {
                    current += 1
                }
            }
        }
    }
}*/
