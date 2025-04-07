//
//  ZikrSettingsView.swift
//  Tasbeeh+ | تسبيح
//
//  Created by A Sky on 14/09/1446 AH.
//
import Foundation
import SwiftUI

struct ZikrSettingsView: View {
    @Binding var selectedTheme: Int
    @Binding var isWarmLightOn: Bool

    var body: some View {
        ZStack {
            AppColor.background(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn)
                .ignoresSafeArea()
                .animation(.easeInOut(duration: 0.5), value: isWarmLightOn)

            VStack {
                Text("إعدادات الأذكار")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                    .padding()

                if #available(iOS 16.0, *) {
                    Form {
                        Section(header: Text("اختيار الثيم")
                            .font(.headline)
                            .foregroundColor(AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))) {
                                
                                Picker("اختر الثيم", selection: $selectedTheme) {
                                    ForEach(1...12, id: \.self) { index in
                                        Text("ثيم \(index)").tag(index)
                                    }
                                }
                                .pickerStyle(SegmentedPickerStyle())
                            }
                    }
                    .background(AppColor.background(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                    .scrollContentBackground(.hidden)
                    .padding()
                    .cornerRadius(12)
                } else {
                    // Fallback on earlier versions
                }
            }
            .padding()
        }
    }
}
