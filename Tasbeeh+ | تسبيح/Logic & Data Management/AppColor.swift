//
//  AppColor.swift
//  Tasbeeh+ | تسبيح
//
//  Created by A Sky on 13/09/1446 AH.
//
///import SwiftUI
//import Foundation
/*import SwiftUI
//مسؤول عن إدارة الألوان وفقًا للثيمات المختلفة.
struct AppColor {
    
    /// **🔹 اللون الأساسي للعناصر والنصوص**
    static func primary(forTheme theme: Int, isWarmLightOn: Bool) -> Color {
        return isWarmLightOn ? Color.white : primaryColors[safe: theme - 1] ?? defaultPrimary
    }
    
    /// **🔹 اللون الثانوي لعناصر التطبيق**
    static func secondary(forTheme theme: Int, isWarmLightOn: Bool) -> Color {
        return isWarmLightOn ? Color.gray.opacity(0.7) : secondaryColors[safe: theme - 1] ?? defaultSecondary
    }
    
    /// **🔹 لون الخلفية مع دعم تأثير الإضاءة الدافئة**
   static func background(forTheme theme: Int, isWarmLightOn: Bool) -> Color {
        return isWarmLightOn ? Color.black.opacity(0.85) : backgroundColors[safe: theme - 1] ?? defaultBackground
        
       /*    static func background(forTheme theme: Int, isWarmLightOn: Bool) -> Color {
            return isWarmLightOn ? Color.black : backgroundColors[safe: theme - 1] ?? warmBackground*/
        
        
    }

    /// **🔹 لون تمييز للعناصر التفاعلية**
    static func accent(forTheme theme: Int, isWarmLightOn: Bool) -> Color {
        return isWarmLightOn ? Color.orange.opacity(0.9) : accentColors[safe: theme - 1] ?? defaultAccent
    }

    /// **🔹 لون خلفية البطاقات بتأثير زجاجي (Glassmorphism)**
    static func cardBackground(forTheme theme: Int, isWarmLightOn: Bool) -> LinearGradient {
        let colors = cardColors[safe: theme - 1] ?? defaultCard
        return LinearGradient(
            gradient: Gradient(colors: colors),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
    // **🎨 ألوان الثيمات - تدرجات حديثة لكل نمط**
    private static let primaryColors: [Color] = [
        warmPrimary, darkPrimary, modernPrimary, Color.blue, Color.purple, Color.orange, Color.green, Color.red,
        galaxyPrimary, sunsetPrimary, forestPrimary,
        coffeePrimary
    ]
    
    private static let secondaryColors: [Color] = [
        warmSecondary, darkSecondary, modernSecondary, Color.cyan, Color.indigo, Color.teal, Color.pink, Color.yellow,
        galaxySecondary, sunsetSecondary, forestSecondary,coffeeSecondary
    ]
    
    private static let accentColors: [Color] = [
        warmAccent, darkAccent, modernAccent, Color.mint, Color.orange, Color.purple, Color.pink, Color.blue,
        galaxyAccent, sunsetAccent, forestAccent,coffeeAccent
    ]
    
   /* private static let backgroundColors: [Color] = [
        warmBackground, darkBackground, modernBackground, Color(UIColor.systemBackground), Color.black.opacity(0.9), Color.gray.opacity(0.8)*/
    private static let backgroundColors: [Color] = [
        warmBackground,  // خلفية ناعمة ومريحة للعين للثيم الدافئ
        darkBackground,  // خلفية داكنة معتدلة تناسب الوضع الليلي دون أن تكون سوداء قاتمة
        modernBackground,  // خلفية متوازنة بين الأبيض والرمادي الفاتح لتتناسب مع التصميمات الحديثة
        Color(UIColor.systemBackground),  // يحدد تلقائيًا خلفية النظام (فاتح/داكن حسب إعدادات الجهاز)
        Color.black.opacity(0.85),  // لون أسود شفّاف قليلًا لإضفاء لمسة أنيقة دون أن يكون قاتمًا جدًا
        Color.gray.opacity(0.75)  // رمادي ناعم ليكون خيارًا وسطيًا بين الأبيض والداكن
    ]
    
    private static let cardColors: [[Color]] = [
        [Color.white.opacity(0.2), Color.white.opacity(0.05)],
        [Color.black.opacity(0.2), Color.black.opacity(0.05)],
        [Color.gray.opacity(0.3), Color.gray.opacity(0.1)]
    ]
    
    // ✅ **إضافة الثيم الأول (الدافئ)**
    static let warmPrimary = Color(red: 0.91, green: 0.44, blue: 0.21)
    static let warmSecondary = Color(red: 0.18, green: 0.36, blue: 0.62)
    static let warmAccent = Color(red: 0.00, green: 0.72, blue: 0.71)
    static let warmBackground = Color(red: 0.98, green: 0.98, blue: 0.98)
    
  
    // ✅ **إضافة الثيم الثاني (الداكن)**
   //لون النصوص
    static let darkPrimary = Color(red: 0.40, green: 0.70, blue: 0.90)
    //لون العناوين الثانوية
   
   // static let darkSecondary = Color(red: 0.65, green: 0.45, blue: 0.85)
    static let darkSecondary = Color(red: 0.30, green: 0.45, blue: 0.65)
    //لون الأزرار
    static let darkAccent = Color(red: 0.85, green: 0.30, blue: 0.70)
    // لون الخلفية
   // static let darkBackground = Color(red: 0.09, green: 0.12, blue: 0.16)
    static let darkBackground = Color(red: 0.98, green: 0.98, blue: 0.98)
    static let darkCardBackground = Color.black.opacity(0.6)
    
  
    // ✅ **إضافة الثيم الثالث (المودرن)**
    static let modernPrimary = Color(red: 0.55, green: 0.27, blue: 0.67)
    static let modernSecondary = Color(red: 0.00, green: 0.50, blue: 0.25)
    static let modernAccent = Color(red: 0.80, green: 0.80, blue: 0.20)
    static let modernBackground = Color(red: 0.92, green: 0.88, blue: 0.99)
    
  
    // ✅ **إضافة الثيم الرابع (مجرة الفضاء - Galaxy)**
    static let galaxyPrimary = Color(red: 0.45, green: 0.20, blue: 0.80)
    static let galaxySecondary = Color(red: 0.30, green: 0.10, blue: 0.50)
    static let galaxyAccent = Color(red: 0.80, green: 0.50, blue: 1.00)
    static let galaxyBackground = Color(red: 0.05, green: 0.00, blue: 0.10)

    // ✅ **إضافة الثيم الخامس (غروب الشمس - Sunset)**
    static let sunsetPrimary = Color(red: 0.90, green: 0.40, blue: 0.30)
    static let sunsetSecondary = Color(red: 0.80, green: 0.20, blue: 0.10)
    static let sunsetAccent = Color(red: 1.00, green: 0.60, blue: 0.20)
    static let sunsetBackground = Color(red: 0.20, green: 0.05, blue: 0.05)

    // ✅ **إضافة الثيم السادس (غابة خضراء - Forest)**
    static let forestPrimary = Color(red: 0.10, green: 0.50, blue: 0.20)
    static let forestSecondary = Color(red: 0.05, green: 0.30, blue: 0.10)
    static let forestAccent = Color(red: 0.40, green: 0.80, blue: 0.50)
    static let forestBackground = Color(red: 0.00, green: 0.15, blue: 0.05)
    

    // ☕ **الثيم السابع (قهوة الصباح) - مع تحديد الأبيض بالأسود**
    static let coffeePrimary = Color.white.opacity(0.95) // لون أبيض شفاف قليلاً مع ظل خارجي
    
    static let coffeeSecondary = Color(red: 37/255, green: 89/255, blue: 49/255)
    static let coffeeAccent = Color(red: 198/255, green: 79/255, blue: 75/255)
    static let coffeeBackground = Color(red: 226/255, green: 156/255, blue: 95/255)



    // **🔹 القيم الافتراضية في حال عدم توفر الثيم**
    private static let defaultPrimary = Color.blue
    private static let defaultSecondary = Color.gray
    private static let defaultAccent = Color.purple
    private static let defaultBackground = Color(UIColor.systemBackground)
    private static let defaultCard = [Color.white.opacity(0.2), Color.white.opacity(0.05)]
    
    
    
    
}

// ✅ **حل مشكلة `Index out of range`**
extension Array {
    subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}*/
import SwiftUI
import Foundation

struct AppColor {
    
    /// **🔹 اللون الأساسي للعناصر والنصوص**
    static func primary(forTheme theme: Int, isWarmLightOn: Bool) -> Color {
        let baseColor = primaryColors[safe: theme - 1] ?? defaultPrimary
        return applyWarmEffect(to: baseColor, isWarmLightOn: isWarmLightOn)
    }
    
    /// **🔹 اللون الثانوي لعناصر التطبيق**
    static func secondary(forTheme theme: Int, isWarmLightOn: Bool) -> Color {
        let baseColor = secondaryColors[safe: theme - 1] ?? defaultSecondary
        return applyWarmEffect(to: baseColor, isWarmLightOn: isWarmLightOn)
    }
    
    /// **🔹 لون الخلفية مع دعم تأثير الإضاءة الدافئة ونمط الجهاز**
    static func background(forTheme theme: Int, isWarmLightOn: Bool) -> Color {
        if isWarmLightOn { return Color.black.opacity(0.85) }
        
        let systemStyle = UITraitCollection.current.userInterfaceStyle
        return systemStyle == .dark
            ? Color.black.opacity(0.9)
            : (backgroundColors[safe: theme - 1] ?? defaultBackground)
    }

    /// **🔹 لون التمييز للعناصر التفاعلية**
    static func accent(forTheme theme: Int, isWarmLightOn: Bool) -> Color {
        let baseColor = accentColors[safe: theme - 1] ?? defaultAccent
        return applyWarmEffect(to: baseColor, isWarmLightOn: isWarmLightOn)
    }

    /// **🔹 لون خلفية البطاقات بتأثير زجاجي (Glassmorphism)**
   /* static func cardBackground(forTheme theme: Int) -> LinearGradient {
        let colors = cardColors[safe: theme - 1] ?? defaultCard
        return LinearGradient(
            gradient: Gradient(colors: colors),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }*/
    static func cardBackground(forTheme theme: Int, isWarmLightOn: Bool) -> LinearGradient {
        var colors = cardColors[safe: theme - 1] ?? defaultCard

        // تطبيق تأثير الإضاءة الدافئة على كل لون في التدرج
        if isWarmLightOn {
            colors = colors.map { $0.blend(with: Color.orange, intensity: 0.15) }
        }

        return LinearGradient(
            gradient: Gradient(colors: colors),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }

    // **🎨 ألوان الثيمات - تدرجات حديثة لكل نمط**
    private static let primaryColors: [Color] = [
        warmPrimary, thulDarkPrimary,noorPrimary , modernPrimary, Color.blue, Color.purple, Color.orange, Color.green, Color.red,
        galaxyPrimary, sunsetPrimary, forestPrimary, coffeePrimary
    ]
    
    private static let secondaryColors: [Color] = [
        warmSecondary, thulDarkSecondary,noorSecondary, modernSecondary, Color.cyan, Color.indigo, Color.teal, Color.pink, Color.yellow,
        galaxySecondary, sunsetSecondary, forestSecondary, coffeeSecondary
    ]
    
    private static let accentColors: [Color] = [
        warmAccent, thulDarkAccent,noorAccent, modernAccent, Color.mint, Color.orange, Color.purple, Color.pink, Color.blue,
        galaxyAccent, sunsetAccent, forestAccent, coffeeAccent
    ]
    
    private static let backgroundColors: [Color] = [
        warmBackground, thulDarkBackground,noorBackground , modernBackground, Color(UIColor.systemBackground),
        Color.black.opacity(0.85), Color.gray.opacity(0.75)
    ]
    
    private static let cardColors: [[Color]] = [
        [Color.white.opacity(0.2), Color.white.opacity(0.05)],
        [Color.black.opacity(0.2), Color.black.opacity(0.05)],
        [Color.gray.opacity(0.3), Color.gray.opacity(0.1)]
    ]
    
    // ✅ **ألوان الثيمات المختلفة**
    static let warmPrimary = Color(red: 0.91, green: 0.44, blue: 0.21)
    static let warmSecondary = Color(red: 0.18, green: 0.36, blue: 0.62)
    static let warmAccent = Color(red: 0.00, green: 0.72, blue: 0.71)
    static let warmBackground = Color(red: 0.98, green: 0.98, blue: 0.98)
    
    static let noorPrimary = Color(red: 0.2, green: 0.18, blue: 0.15)           // بني داكن ناعم – للنصوص الرئيسية
    static let noorSecondary = Color(red: 0.4, green: 0.36, blue: 0.3)          // بني فاتح – للعناوين أو نصوص فرعية
    static let noorAccent = Color(red: 0.8, green: 0.7, blue: 0.5)              // بيج ذهبي – لمسة دفء وتميّز
    static let noorBackground = Color(red: 0.98, green: 0.96, blue: 0.93)       // كريمي عاجي – خلفية مريحة جدًا

    /*static let techPrimary = Color(red: 0.93, green: 0.94, blue: 0.95)          // لون النص - رمادي فاتح، رسمي وهادئ
    static let techSecondary = Color(red: 0.5, green: 0.55, blue: 0.6)          // لون ثانوي - رمادي مزرق داكن، ناعم ومريح
    static let techAccent = Color(red: 0.25, green: 0.6, blue: 0.9)             // لون مميز - أزرق تقني هادئ وواضح
    static let techBackground = Color(red: 0.04, green: 0.05, blue: 0.06)       // خلفية داكنة جدًا - رمادي فحمي أنيق*/

  /*  static let darkPrimary = Color(red: 0.85, green: 0.85, blue: 0.85)
    static let darkSecondary = Color(red: 0.55, green: 0.55, blue: 0.55)
    static let darkAccent = Color(red: 0.95, green: 0.40, blue: 0.70)
    static let darkBackground = Color(red: 0.12, green: 0.12, blue: 0.12)*/
    static let thulDarkPrimary = Color(red: 0.92, green: 0.94, blue: 0.96)     // لون النص الرئيسي - قريب من الأبيض لكن أهدأ
    static let thulDarkSecondary = Color(red: 0.65, green: 0.7, blue: 0.75)    // لون النص الثانوي - رمادي مزرق
    static let thulDarkAccent = Color(red: 0.55, green: 0.75, blue: 1.0)       // لون مميز - أزرق سماوي هادئ
    static let thulDarkBackground = Color(red: 0.05, green: 0.06, blue: 0.08)  // لون الخلفية - أسود مزرق عميق

    
    static let modernPrimary = Color(red: 0.55, green: 0.27, blue: 0.67)
    static let modernSecondary = Color(red: 0.00, green: 0.50, blue: 0.25)
    static let modernAccent = Color(red: 0.80, green: 0.80, blue: 0.20)
    static let modernBackground = Color(red: 0.92, green: 0.88, blue: 0.99)
    
    
   static let galaxyPrimary = Color(red: 0.45, green: 0.20, blue: 0.80)
    static let galaxySecondary = Color(red: 0.30, green: 0.10, blue: 0.50)
    static let galaxyAccent = Color(red: 0.80, green: 0.50, blue: 1.00)
    
    static let sunsetPrimary = Color(red: 0.90, green: 0.40, blue: 0.30)
    static let sunsetSecondary = Color(red: 0.80, green: 0.20, blue: 0.10)
    static let sunsetAccent = Color(red: 1.00, green: 0.60, blue: 0.20)
    
    static let forestPrimary = Color(red: 0.10, green: 0.50, blue: 0.20)
    static let forestSecondary = Color(red: 0.05, green: 0.30, blue: 0.10)
    static let forestAccent = Color(red: 0.40, green: 0.80, blue: 0.50)
    
    static let coffeePrimary = Color.white.opacity(0.95)
    static let coffeeSecondary = Color(red: 37/255, green: 89/255, blue: 49/255)
    static let coffeeAccent = Color(red: 198/255, green: 79/255, blue: 75/255)
    
    // **🔹 القيم الافتراضية في حال عدم توفر الثيم**
    private static let defaultPrimary = Color.blue
    private static let defaultSecondary = Color.gray
    private static let defaultAccent = Color.purple
    private static let defaultBackground = Color(UIColor.systemBackground)
    private static let defaultCard = [Color.white.opacity(0.2), Color.white.opacity(0.05)]

    /// **📌 دالة تعديل الألوان عند تشغيل الإضاءة الدافئة**
    private static func applyWarmEffect(to color: Color, isWarmLightOn: Bool) -> Color {
        return isWarmLightOn ? color.blend(with: Color.orange, intensity: 0.15) : color
    }
}

extension Color {
    func blend(with color: Color, intensity: Double) -> Color {
        let uiColor1 = UIColor(self)
        let uiColor2 = UIColor(color)
        
        var r1: CGFloat = 0, g1: CGFloat = 0, b1: CGFloat = 0, a1: CGFloat = 0
        var r2: CGFloat = 0, g2: CGFloat = 0, b2: CGFloat = 0, a2: CGFloat = 0
        
        uiColor1.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
        uiColor2.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)
        
        return Color(
            red: Double(r1 + (r2 - r1) * intensity),
            green: Double(g1 + (g2 - g1) * intensity),
            blue: Double(b1 + (b2 - b1) * intensity),
            opacity: Double(a1 + (a2 - a1) * intensity)
        )
    }
}


// ✅ **حل مشكلة `Index out of range`**
extension Array {
    subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
