//
//  CustomTabBar.swift
//  Tasbeeh+ | تسبيح
//
//  Created by A Sky on 13/09/1446 AH.
//


/*import Foundation
import SwiftUI
//شريط التنقل السفلي المخصص

struct CustomTabBar: View {
    @Binding var activeTab: Tab
    @Binding var isWarmLightOn: Bool
    @Binding var selectedTheme: Int
    @Binding var tabTexts: [Tab: String]

    var body: some View {
        HStack(spacing: 0) {
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                let tabText = tabTexts[tab] ?? "" // ✅ إعطاء قيمة افتراضية إذا كانت `nil`
                
                TabItem(
                    tab: tab,
                    activeTab: $activeTab,
                    tabText: tabText.isEmpty ? tab.defaultTitle() : tabText, // ✅ حل مشكلة `isEmpty`
                    isWarmLightOn: isWarmLightOn,
                    selectedTheme: selectedTheme
                )
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .background(AppColor.background(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
        .clipShape(Capsule())
        .shadow(radius: 5)
        
    }
}*/
import Foundation
import SwiftUI

struct CustomTabBar: View {
    @Binding var activeTab: Tab
    @Binding var isWarmLightOn: Bool
    @Binding var selectedTheme: Int

    var body: some View {
        HStack(spacing: 0) {
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                TabItem(
                    tab: tab,
                    activeTab: $activeTab,
                    tabText: tab.displayTitle(), // ✅ استخدام الدالة الجديدة من enum
                    isWarmLightOn: isWarmLightOn,
                    selectedTheme: selectedTheme
                )
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .background(AppColor.background(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
        .clipShape(Capsule())
        .shadow(radius: 5)
    }
}
