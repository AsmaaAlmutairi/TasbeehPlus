//
//  Tab.swift
//  Tasbeeh+ | تسبيح
//
//  Created by A Sky on 13/09/1446 AH.
//
/*import SwiftUI
import Foundation
import Foundation
//عريف الـ enum الخاص بالتبويبات المختلفة في التطبيق.
enum Tab: String, CaseIterable, Identifiable {
    case counter1
    case counter2
    case counter3
    case azkar
    case الإعدادات_المتقدمة // ✅ ستبقى في الـ Tab Bar

    var id: String { rawValue }

    func systemImage() -> String {
        switch self {
        case .azkar: return "book.fill"
        case .counter1: return "hands.sparkles.fill"
        case .counter2: return "heart.fill"
        case .counter3: return "sun.max.fill"
        case .الإعدادات_المتقدمة: return "gearshape.fill" // ✅ رمز الإعدادات
        }
    }

    /// **🔹 توفير النص الافتراضي عند عدم إدخال المستخدم نصًا**
    func defaultTitle() -> String {
        switch self {
        case .counter1: return ""
        case .counter2: return ""
        case .counter3: return ""
        case .azkar: return "الأذكار"
        case .الإعدادات_المتقدمة: return "الإعدادات "
        }
    }
}*/
import SwiftUI
import Foundation

enum Tab: String, CaseIterable, Identifiable {
    case counter1
    case counter2
    case counter3
    case azkar
    case الإعدادات_المتقدمة

    var id: String { rawValue }

    func systemImage() -> String {
        switch self {
        case .azkar: return "book.fill"
        case .counter1: return "hands.sparkles.fill"
        case .counter2: return "heart.fill"
        case .counter3: return "sun.max.fill"
        case .الإعدادات_المتقدمة: return "gearshape.fill"
        }
    }

    /// 🔹 النص الظاهر في TabItem — من AppStorage أو النص الافتراضي
    func displayTitle() -> String {
        switch self {
        case .counter1:
            return UserDefaults.standard.string(forKey: "counter1Text") ?? ""
        case .counter2:
            return UserDefaults.standard.string(forKey: "counter2Text") ?? ""
        case .counter3:
            return UserDefaults.standard.string(forKey: "counter3Text") ?? ""
        case .azkar:
            return "الأذكار"
        case .الإعدادات_المتقدمة:
            return "الإعدادات"
        }
    }
}
