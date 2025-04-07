//
//  StatisticsDetailView.swift
//  Tasbeeh+ | تسبيح
//
//  Created by A Sky on 14/09/1446 AH.
//
/*import Foundation
import SwiftUI

struct StatisticsDetailView: View {
    let istighfarCount: Int
    let hawqalaCount: Int
    let salatCount: Int
    @Binding var selectedTheme: Int // ✅ دعم الثيمات الجديدة
    @Binding var isWarmLightOn: Bool // ✅ دعم الإضاءة الدافئة

    var body: some View {
        ZStack {
            // ✅ تغيير الخلفية بناءً على الإضاءة الدافئة
            AppColor.background(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn)
                .ignoresSafeArea()
                .animation(.easeInOut(duration: 0.5), value: isWarmLightOn)

            VStack {
                Text("تفاصيل الإحصائيات")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                    .padding()

                VStack(spacing: 15) {
                    statRow(title: "  ", count: istighfarCount, color: .blue)
                    statRow(title: "  ", count: hawqalaCount, color: .green)
                    statRow(title: "  ", count: salatCount, color: .orange)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(AppColor.secondary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn).opacity(0.2))
                        .shadow(radius: 5)
                )
                .padding()

                Spacer()
            }
            .padding()
        }
    }

    /// **🔹 تحسين طريقة عرض كل إحصائية**
    private func statRow(title: String, count: Int, color: Color) -> some View {
        HStack {
            Text(title)
                .font(.title3)
                .bold()
                .foregroundColor(AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))

            Spacer()

            Text("\(count)")
                .font(.title3)
                .bold()
                .foregroundColor(color)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(RoundedRectangle(cornerRadius: 8).fill(color.opacity(0.2)))
                .shadow(radius: 2)
        }
        .padding()
        .background(AppColor.background(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn).opacity(0.1))
        .cornerRadius(12)
    }
}*/
import Foundation
import SwiftUI

struct StatisticsDetailView: View {
    let istighfarCount: Int
    let hawqalaCount: Int
    let salatCount: Int
    @Binding var selectedTheme: Int
    @Binding var isWarmLightOn: Bool

    @Environment(\.dismiss) private var dismiss // ⬅️ زر الرجوع

    var body: some View {
        ZStack {
            AppColor.background(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn)
                .ignoresSafeArea()
                .animation(.easeInOut(duration: 0.5), value: isWarmLightOn)

            VStack {
                Text("تفاصيل الإحصائيات")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                    .padding()

                VStack(spacing: 15) {
                    statRow(title: "الاستغفار", count: istighfarCount, color: .blue)
                    statRow(title: "الحوقلة", count: hawqalaCount, color: .green)
                    statRow(title: "الصلاة على النبي", count: salatCount, color: .orange)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(AppColor.secondary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn).opacity(0.2))
                        .shadow(radius: 5)
                )
                .padding()

                Spacer()
            }
            .padding()
        }

        // ✅ زر رجوع يدوي احترافي (بدون نص)
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
                        .background(Color.clear)
                        .clipShape(Circle())
                }
            }
        }
    }

    private func statRow(title: String, count: Int, color: Color) -> some View {
        HStack {
            Text(title)
                .font(.title3)
                .bold()
                .foregroundColor(AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))

            Spacer()

            Text("\(count)")
                .font(.title3)
                .bold()
                .foregroundColor(color)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(RoundedRectangle(cornerRadius: 8).fill(color.opacity(0.2)))
                .shadow(radius: 2)
        }
        .padding()
        .background(AppColor.background(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn).opacity(0.1))
        .cornerRadius(12)
    }
}
