//
//  PrayerCardView.swift
//  Tasbeeh+ | تسبيح
//
//  Created by A Sky on 13/09/1446 AH.
//
import Foundation
/*import SwiftUI

struct PrayerCardView: View {
    let prayerKey: String
    let prayerTime: String
    let selectedTheme: Int
    let isWarmLightOn: Bool

    var body: some View {
        // تصميم البطاقة
        Text("صلاة: \(prayerKey) - الوقت: \(prayerTime)")
    }
}*/
import SwiftUI
//عنصر يعرض معلومات عن وقت صلاة معين.
struct PrayerCardView: View {
    let prayerKey: String
    let prayerTime: String
    let selectedTheme: Int
    let isWarmLightOn: Bool
    
    private func localizedPrayerName(_ key: String) -> String {
        let names: [String: String] = [
            "Fajr": "الفجر",
            "Dhuhr": "الظهر",
            "Asr": "العصر",
            "Maghrib": "المغرب",
            "Isha": "العشاء"
        ]
        return names[key] ?? key
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            // أيقونة للصلاة
            Image(systemName: iconName(for: prayerKey))
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(
                    AppColor.accent(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn)
                )
                .frame(width: 44, height: 44)
                .background(
                    Circle()
                        .fill(
                            AppColor.secondary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn)
                                .opacity(0.2)
                        )
                )
            
            VStack(alignment: .leading, spacing: 4) {
                Text(localizedPrayerName(prayerKey))
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundColor(
                        AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn)
                    )
                
                Text(prayerTime)
                    .font(.system(size: 18, weight: .medium, design: .rounded))
                    .foregroundColor(
                        AppColor.secondary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn)
                    )
            }
            Spacer()
        }
        .padding(16)
        .background(
            // خلفية زجاجية أو تدرج
            RoundedRectangle(cornerRadius: 16)
                .fill(
                    AppColor.cardBackground(forTheme: 1, isWarmLightOn: true)

                    //AppColor.cardBackground(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn)
                )
        )
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 3)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .strokeBorder(
                    AppColor.secondary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn)
                        .opacity(0.1),
                    lineWidth: 1
                )
        )
    }
    
    /// أيقونات مختلفة لكل صلاة
    private func iconName(for prayerKey: String) -> String {
        switch prayerKey {
        case "Fajr":
            return "sun.and.horizon.fill"
        case "Dhuhr":
            return "sun.max.fill"
        case "Asr":
            return "sun.max.circle.fill"
        case "Maghrib":
            return "sun.haze.fill"
        case "Isha":
            return "moon.stars.fill"
        default:
            return "sun.max.fill"
        }
    }
}
