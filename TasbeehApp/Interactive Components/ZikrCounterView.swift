//
//  ZikrCounterView.swift
//  Tasbeeh+ | تسبيح
//
//  Created by A Sky on 13/09/1446 AH.
//

import Foundation
import SwiftUI
//شاشة لعد الأذكار يدويًا.
struct ZikrCounterView: View {
    @Binding var isWarmLightOn: Bool
    @Binding var selectedTheme: Int
    @Binding var zikrText: String
    @Binding var count: Int
    
    @State private var scaleEffect: CGFloat = 1.0
    @State private var rotationAngle: Double = 0.0
    
    var body: some View {
        VStack(spacing: 20) {
            
            // حقل إدخال النص
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(AppColor.background(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn).opacity(0.2))
                    .shadow(color: .black.opacity(0.1), radius: 5)
                    .frame(height: 55)
                
                HStack {
                    Image(systemName: "pencil")
                        .foregroundColor(AppColor.accent(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                    
                    TextField("✍️ ابدأ التسبيح هنا", text: $zikrText)
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .foregroundColor(AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                }
                .padding(.horizontal, 15)
            }
            .padding(.horizontal, 20)
            .background(AppColor.background(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
            .keyboardResponsive(offset: 20)
            
            Spacer()
            
            // عرض العداد
            Text("\(count)")
                .font(.system(size: 100, weight: .heavy, design: .rounded))
                .foregroundColor(AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                .shadow(color: AppColor.accent(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn).opacity(0.5), radius: 8)
                .padding(.bottom, 30)
                .rotationEffect(.degrees(rotationAngle))
            
            // أزرار التحكم
            HStack(spacing: 40) {
                Button(action: resetCounter) {
                    CircleButton(
                        icon: "arrow.clockwise",
                        color: AppColor.accent(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn).opacity(0.8),
                        size: 80 // تم إضافة البارامتر المطلوب
                    )
                    .rotationEffect(.degrees(rotationAngle))
                }
                
                Button(action: incrementCounter) {
                    CircleButton(
                        icon: "plus",
                        color:
                            AppColor.accent(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn),
                        size: 110 // تم إضافة البارامتر المطلوب
                    )
                    .scaleEffect(scaleEffect)
                }
            }
            
            Spacer(minLength: 50)
        }
        .padding()
        .background(AppColor.background(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
    }
    
    private func incrementCounter() {
        count += 1
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        
        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
            scaleEffect = 1.2
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            withAnimation {
                scaleEffect = 1.0
            }
        }
    }
    
    private func resetCounter() {
        count = 0
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        
        withAnimation(.easeInOut(duration: 0.5)) {
            rotationAngle += 360
        }
    }
}
