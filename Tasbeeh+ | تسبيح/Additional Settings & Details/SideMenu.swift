//
//  SideMenu.swift
//  Tasbeeh+ | تسبيح
//
//  Created by A Sky on 14/09/1446 AH.
//

import Foundation
import SwiftUI

struct SideMenu: View {
    @Binding var showSideMenu: Bool
    @Binding var selectedTheme: Int // ✅ دعم السمات الجديدة
    @Binding var isWarmLightOn: Bool // ✅ دعم الإضاءة الداكئة
    @State private var navigateToStatistics = false

    var body: some View {
        ZStack {
            // ✅ تحسين مظهر الخلفية مع دعم الإضاءة الداكئة
            AppColor.background(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn)
                .opacity(0.8)
                .ignoresSafeArea()
                .animation(.easeInOut(duration: 0.5), value: isWarmLightOn)
                .onTapGesture {
                    withAnimation {
                        showSideMenu = false
                    }
                }

            HStack {
                VStack(alignment: .leading, spacing: 20) {
                    Text("القائمة")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                        .padding(.bottom, 20)

                    // ✅ تحسين الأزرار مع دعم الإضاءة الدافئة
                    menuItem(title: "الإحصائيات", icon: "chart.bar.fill") {
                        navigateToStatistics = true
                        showSideMenu = false
                    }

                    menuItem(title: "الدعم", icon: "questionmark.circle.fill") {
                        // إضافة الأكشن المطلوب لاحقًا
                    }

                    menuItem(title: "الاقتراحات", icon: "lightbulb.fill") {
                        // إضافة الأكشن المطلوب لاحقًا
                    }

                    Spacer()
                }
                .padding()
                .frame(maxWidth: 280)
                .background(AppColor.background(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn).opacity(0.9))
                .cornerRadius(15)
                .shadow(radius: 10)

                Spacer()
            }
        }
    }

    /// **✅ تحسين تصميم أزرار القائمة الجانبية**
    private func menuItem(title: String, icon: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundColor(AppColor.accent(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                Text(title)
                    .font(.title3)
                    .foregroundColor(AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(AppColor.secondary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn).opacity(0.2))
                    .shadow(radius: 3)
            )
        }
    }
}
