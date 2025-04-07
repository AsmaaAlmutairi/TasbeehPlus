//
//  ZikrFooterView.swift
//  Tasbeeh+ | تسبيح
//
//  Created by A Sky on 14/09/1446 AH.
//

import SwiftUI

struct ZikrFooterView: View {
    var onCopy: () -> Void
    var onShare: () -> Void
    @Binding var completedRepetitions: Int
    let totalRepetitions: Int
    var onComplete: () -> Void
    var selectedTheme: Int
    var isWarmLightOn: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            // ✅ العداد الدائري بتأثير قطرة الماء
            ZStack {
                // ✅ الدائرة الخلفية الشفافة لتأثير قطرة الماء
                Circle()
                    .fill(AppColor.accent(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn).opacity(0.2))
                    .frame(width: 150, height: 150)

                // ✅ الدائرة الأساسية للعداد
                Circle()
                    .fill(AppColor.accent(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                    .frame(width: 120, height: 120)
                    .shadow(color: AppColor.accent(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn).opacity(0.5), radius: 8, x: 0, y: 4)

                // ✅ النص داخل الزر
                Text("\(completedRepetitions) / \(totalRepetitions)")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.white)
                    .shadow(radius: 2)

                // ✅ الخط المتحرك في الخلف
                Circle()
                    .trim(from: 0, to: CGFloat(completedRepetitions) / CGFloat(max(totalRepetitions, 1)))
                    .stroke(
                        AppColor.accent(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn),
                        style: StrokeStyle(lineWidth: 10, lineCap: .round)
                    )
                    .rotationEffect(.degrees(-90))
                    .frame(width: 160, height: 160) // خلف الزر ليظهر كطبقة سفلية
                    .opacity(0.7)
                    .animation(.easeInOut(duration: 0.5), value: completedRepetitions)
            }
            .frame(height: 150)
            .padding(.bottom, 10)
            .onTapGesture {
                if completedRepetitions < totalRepetitions {
                    completedRepetitions += 1
                }
                if completedRepetitions >= totalRepetitions {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        onComplete()
                    }
                }
            }

            // ✅ أزرار النسخ والمشاركة
            HStack(spacing: 30) {
                Button(action: onShare) {
                    Image(systemName: "square.and.arrow.up")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 26, height: 26) // حجم متناسق
                        .foregroundColor(.orange)
                        .padding(12)
                        .background(Circle().fill(Color.white).shadow(radius: 3))
                        .overlay(
                            Circle().stroke(Color.orange.opacity(0.5), lineWidth: 2)
                        )
                }

                Button(action: onCopy) {
                    Image(systemName: "doc.on.doc")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 26, height: 26)
                        .foregroundColor(.blue)
                        .padding(12)
                        .background(Circle().fill(Color.white).shadow(radius: 3))
                        .overlay(
                            Circle().stroke(Color.blue.opacity(0.5), lineWidth: 2)
                        )
                }
            }
            .padding(.horizontal, 30)
        }
        .padding(.bottom, 20)
    }
}
