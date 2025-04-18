//
//  AdvancedStatisticsView.swift
//  Tasbeeh+ | تسبيح
//
//  Created by A Sky on 13/09/1446 AH.
//

/*import Foundation
import SwiftUI
import Charts
//شاشة عرض الإحصائيات 
struct AdvancedStatisticsView: View {
    let istighfarCount: Int
    let hawqalaCount: Int
    let salatCount: Int
    let istighfarText: String
    let hawqalaText: String
    let salatText: String
    @Binding var isWarmLightOn: Bool
    @Binding var selectedTheme: Int

    var totalZikr: Int {
        return istighfarCount + hawqalaCount + salatCount
    }

    var body: some View {
        ZStack {
            // ✅ دعم الإضاءة الداكئة في الخلفية
            AppColor.background(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn)
                .ignoresSafeArea()
                .animation(.easeInOut(duration: 0.5), value: isWarmLightOn)

            VStack(spacing: 20) {
                Text("📊 الإحصائيات ")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                    .padding(.top, 30)

                // ✅ **عرض الإحصائيات في بطاقات متحركة**
                HStack(spacing: 15) {
                    statCard(title: istighfarText.isEmpty ? "1" : istighfarText,
                             count: istighfarCount,
                             color: AppColor.accent(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))

                    statCard(title: hawqalaText.isEmpty ? " 2" : hawqalaText,
                             count: hawqalaCount,
                             color: AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))

                    statCard(title: salatText.isEmpty ? " 3" : salatText,
                             count: salatCount,
                             color: AppColor.secondary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                }
                .padding(.horizontal)

                // ✅ **عرض الإحصائيات في مخطط دائري**
                if totalZikr > 0 {
                    PieChartView(
                        data: [Double(istighfarCount), Double(hawqalaCount), Double(salatCount)],
                        labels: [
                            istighfarText.isEmpty ? "" : istighfarText,
                            hawqalaText.isEmpty ? "" : hawqalaText,
                            salatText.isEmpty ? "" : salatText
                        ],
                        colors: [
                            AppColor.accent(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn),
                            AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn),
                            AppColor.secondary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn)
                        ]
                    )
                    .frame(height: 250)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(AppColor.background(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn).opacity(0.5))
                            .shadow(radius: 5)
                    )
                }

                Spacer()
            }
            .padding()
        }
    }

    /// **🔹 دالة لإنشاء بطاقة إحصائية محسنة**
    private func statCard(title: String, count: Int, color: Color) -> some View {
        VStack {
            Text(title)
                .font(.headline)
                .foregroundColor(color)
            Text("\(count)")
                .font(.largeTitle)
                .bold()
                .foregroundColor(AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
        }
        .padding()
        .frame(width: 100, height: 100)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(AppColor.background(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn).opacity(0.2))
                .shadow(radius: 5)
        )
    }
}*/
import Foundation
import SwiftUI
import Charts

// شاشة عرض الإحصائيات
struct AdvancedStatisticsView: View {
    let istighfarCount: Int
    let hawqalaCount: Int
    let salatCount: Int
    let istighfarText: String
    let hawqalaText: String
    let salatText: String
    @Binding var isWarmLightOn: Bool
    @Binding var selectedTheme: Int

    @Environment(\.dismiss) private var dismiss // ✅ زر الرجوع اليدوي

    var totalZikr: Int {
        return istighfarCount + hawqalaCount + salatCount
    }

    var body: some View {
        ZStack {
            AppColor.background(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn)
                .ignoresSafeArea()
                .animation(.easeInOut(duration: 0.5), value: isWarmLightOn)

            VStack(spacing: 20) {
                Text("📊 الإحصائيات")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                    .padding(.top, 30)

                // ✅ بطاقات الإحصائيات
                HStack(spacing: 15) {
                    statCard(
                        title: istighfarText.isEmpty ? "الاستغفار" : istighfarText,
                        count: istighfarCount,
                        color: AppColor.accent(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn)
                    )

                    statCard(
                        title: hawqalaText.isEmpty ? "الحوقلة" : hawqalaText,
                        count: hawqalaCount,
                        color: AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn)
                    )

                    statCard(
                        title: salatText.isEmpty ? "الصلاة على النبي" : salatText,
                        count: salatCount,
                        color: AppColor.secondary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn)
                    )
                }
                .padding(.horizontal)

                // ✅ المخطط الدائري
                if totalZikr > 0 {
                    PieChartView(
                        data: [Double(istighfarCount), Double(hawqalaCount), Double(salatCount)],
                        labels: [
                            istighfarText.isEmpty ? "الاستغفار" : istighfarText,
                            hawqalaText.isEmpty ? "الحوقلة" : hawqalaText,
                            salatText.isEmpty ? "الصلاة على النبي" : salatText
                        ],
                        colors: [
                            AppColor.accent(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn),
                            AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn),
                            AppColor.secondary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn)
                        ]
                    )
                    .frame(height: 250)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(AppColor.background(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn).opacity(0.5))
                            .shadow(radius: 5)
                    )
                }

                Spacer()
            }
            .padding()
        }
        // ✅ تفعيل زر رجوع يدوي بدون نص
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.backward")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                        .padding(8)
                }
            }
        }
    }

    /// دالة إنشاء بطاقة إحصائية
    private func statCard(title: String, count: Int, color: Color) -> some View {
        VStack {
            Text(title)
                .font(.headline)
                .foregroundColor(color)

            Text("\(count)")
                .font(.largeTitle)
                .bold()
                .minimumScaleFactor(0.5) // يصغر حتى 50% من الحجم الأصلي
                .lineLimit(1) // سطر واحد فقط
                .padding(.horizontal, 4) // زيادة بسيطة للحواف
                .foregroundColor(AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
        }
        .padding()
        .frame(width: 100, height: 100)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(AppColor.background(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn).opacity(0.2))
                .shadow(radius: 5)
        )
    }
}

