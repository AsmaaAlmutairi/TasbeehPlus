//
//  TabItem.swift
//  Tasbeeh+ | تسبيح
//
//  Created by A Sky on 13/09/1446 AH.
//

import Foundation
import SwiftUI
//عنصر فردي في شريط التنقل
struct TabItem: View {
    var tab: Tab
    @Binding var activeTab: Tab
    var tabText: String // ✅ استخدام `tabText`
    var isWarmLightOn: Bool
    var selectedTheme: Int

    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: tab.systemImage()) // ✅ استدعاء `systemImage()`
                .font(.title2)
                .foregroundColor(activeTab == tab ? AppColor.accent(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn)
                                                  : AppColor.secondary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                .frame(width: 35, height: 35)
                .scaleEffect(activeTab == tab ? 1.2 : 1.0) // ✅ تأثير عند التحديد
                .animation(.easeInOut(duration: 0.2), value: activeTab)

            if !tabText.isEmpty { // ✅ إظهار النص فقط إذا كان المستخدم قد أدخله
                Text(tabText)
                    .font(.caption)
                    .foregroundColor(activeTab == tab ? AppColor.accent(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn)
                                                      : AppColor.secondary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                    .transition(.opacity)
                    .animation(.easeInOut(duration: 0.2), value: tabText)
            }
        }
        .frame(maxWidth: .infinity)
        .onTapGesture {
            withAnimation {
                activeTab = tab
            }
        }
    }
}
