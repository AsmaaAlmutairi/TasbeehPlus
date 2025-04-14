//
//  SettingsView.swift
//  Tasbeeh+ | تسبيح
//
//  Created by A Sky on 13/09/1446 AH.
//

/*import SwiftUI
import Foundation

enum SettingsDestination: Hashable {
    case statistics
    case prayerTimes
    case support
}

struct SettingsView: View {
    // MARK: - Bindings
    @Binding var isWarmLightOn: Bool
    @Binding var selectedTheme: Int
    @Binding var istighfarCount: Int
    @Binding var hawqalaCount: Int
    @Binding var salatCount: Int

    @AppStorage("counter1Text") private var istighfarText = ""
    @AppStorage("counter2Text") private var hawqalaText = ""
    @AppStorage("counter3Text") private var salatText = ""

    // MARK: - التنقل الحديث
    @State private var path: [SettingsDestination] = []

    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack(path: $path) {
                if #available(iOS 16.0, *) {
                    ZStack {
                        AppColor.background(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn)
                            .ignoresSafeArea()
                            .animation(.easeInOut(duration: 0.4), value: isWarmLightOn)
                        
                        ScrollView {
                            VStack(spacing: 15) {
                                // ✅ العنوان
                                Text("إعدادات التطبيق")
                                    .font(.system(size: 24, weight: .bold, design: .rounded))
                                    .foregroundColor(AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                                    .padding(.top, 16)
                                
                                // ✅ زر الإضاءة
                                HStack {
                                    Spacer()
                                    Button(action: { isWarmLightOn.toggle() }) {
                                        HStack(spacing: 6) {
                                            Image(systemName: isWarmLightOn ? "moon.fill" : "sun.max.fill")
                                            Text(isWarmLightOn ? "الوضع الليلي" : "الوضع الفاتح")
                                        }
                                    }
                                    .buttonStyle(CompactButtonStyle(isWarmLightOn: $isWarmLightOn, selectedTheme: selectedTheme))
                                }
                                .padding(.horizontal, 20)
                                
                                // ✅ زر الثيم
                                HStack {
                                    Spacer()
                                    Button(action: { selectedTheme = (selectedTheme % 12) + 1 }) {
                                        HStack(spacing: 6) {
                                            Image(systemName: "paintbrush.fill")
                                            Text("تغيير السمة")
                                        }
                                    }
                                    .buttonStyle(CompactButtonStyle(isWarmLightOn: $isWarmLightOn, selectedTheme: selectedTheme))
                                }
                                .padding(.horizontal, 20)
                                
                                // ✅ حقول الأذكار
                                VStack(spacing: 10) {
                                    customTextField(title: "✍️ نص الاستغفار", text: $istighfarText)
                                    customTextField(title: "✍️ نص الحوقلة", text: $hawqalaText)
                                    customTextField(title: "✍️ نص الصلاة على النبي", text: $salatText)
                                }
                                .padding(.horizontal, 20)
                                
                                // ✅ أزرار التنقل
                                VStack(spacing: 10) {
                                    settingsButton(title: "📊 الإحصائيات", icon: "chart.bar.fill") {
                                        path.append(.statistics)
                                    }
                                    
                                    settingsButton(title: "🕰️ مواقيت الصلاة", icon: "clock.fill") {
                                        path.append(.prayerTimes)
                                    }
                                    
                                    settingsButton(title: "🛠️ الدعم الفني", icon: "questionmark.circle.fill") {
                                        path.append(.support)
                                    }
                                }
                                .padding(.horizontal, 20)
                                
                                Spacer().frame(height: 20)
                            }
                            .padding(.vertical, 10)
                        }
                    }
                    .navigationDestination(for: SettingsDestination.self) { destination in
                        switch destination {
                        case .statistics:
                            AdvancedStatisticsView(
                                istighfarCount: istighfarCount,
                                hawqalaCount: hawqalaCount,
                                salatCount: salatCount,
                                istighfarText: istighfarText,
                                hawqalaText: hawqalaText,
                                salatText: salatText,
                                isWarmLightOn: $isWarmLightOn,
                                selectedTheme: $selectedTheme
                            )
                            
                        case .prayerTimes:
                            PrayerTimesView()
                            
                        case .support:
                            SupportView(isWarmLightOn: $isWarmLightOn, selectedTheme: $selectedTheme)
                        }
                    }
                } else {
                    // Fallback on earlier versions
                }
            }
        } else {
            // Fallback on earlier versions
        }
    }

    // ✅ زر إعدادات مخصص
    private func settingsButton(title: String, icon: String, action: @escaping () -> Void) -> some View {
        HStack {
            Spacer()
            Button(action: action) {
                HStack(spacing: 6) {
                    Image(systemName: icon)
                        .font(.system(size: 16, weight: .bold))
                    Text(title)
                }
            }
            .buttonStyle(CompactButtonStyle(isWarmLightOn: $isWarmLightOn, selectedTheme: selectedTheme))
        }
    }

    // ✅ حقل نص مخصص
    private func customTextField(title: String, text: Binding<String>) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(AppColor.secondary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn).opacity(0.2))
                .frame(height: 44)
                .shadow(color: .black.opacity(0.05), radius: 3)
            HStack {
                Image(systemName: "pencil")
                    .foregroundColor(AppColor.accent(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                TextField(title, text: text)
                    .font(.system(size: 14))
                    .foregroundColor(AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
            }
            .padding(.horizontal, 10)
        }
        .padding(.horizontal, 10)
    }
}*/
import SwiftUI
import Foundation

enum SettingsDestination: Hashable {
    case statistics
    case prayerTimes
    case support
}

struct SettingsView: View {
    // MARK: - Bindings
    @Binding var isWarmLightOn: Bool
    @Binding var selectedTheme: Int
    @Binding var istighfarCount: Int
    @Binding var hawqalaCount: Int
    @Binding var salatCount: Int

    @AppStorage("counter1Text") private var istighfarText = ""
    @AppStorage("counter2Text") private var hawqalaText = ""
    @AppStorage("counter3Text") private var salatText = ""

    // MARK: - التنقل الحديث
    @State private var path: [SettingsDestination] = []

    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack(path: $path) {
                ZStack {
                    AppColor.background(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn)
                        .ignoresSafeArea()
                        .animation(.easeInOut(duration: 0.4), value: isWarmLightOn)

                    ScrollView {
                        VStack(spacing: 15) {
                            // ✅ العنوان
                            Text("إعدادات التطبيق")
                                .font(.system(size: 24, weight: .bold, design: .rounded))
                                .foregroundColor(AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                                .padding(.top, 16)

                            // ✅ زر الإضاءة
                            HStack {
                                Spacer()
                                Button(action: { isWarmLightOn.toggle() }) {
                                    HStack(spacing: 6) {
                                        Image(systemName: isWarmLightOn ? "moon.fill" : "sun.max.fill")
                                        Text(isWarmLightOn ? "الوضع الليلي" : "الوضع الفاتح")
                                    }
                                }
                                .buttonStyle(CompactButtonStyle(isWarmLightOn: $isWarmLightOn, selectedTheme: selectedTheme))
                            }
                            .padding(.horizontal, 20)

                            // ✅ زر الثيم
                            HStack {
                                Spacer()
                                Button(action: { selectedTheme = (selectedTheme % 12) + 1 }) {
                                    HStack(spacing: 6) {
                                        Image(systemName: "paintbrush.fill")
                                        Text("تغيير السمة")
                                    }
                                }
                                .buttonStyle(CompactButtonStyle(isWarmLightOn: $isWarmLightOn, selectedTheme: selectedTheme))
                            }
                            .padding(.horizontal, 20)

                            // ✅ حقول الأذكار
                            VStack(spacing: 10) {
                                customTextField(title: "✍️ نص الاستغفار", text: $istighfarText)
                                customTextField(title: "✍️ نص الحوقلة", text: $hawqalaText)
                                customTextField(title: "✍️ نص الصلاة على النبي", text: $salatText)
                            }
                            .padding(.horizontal, 20)

                            // ✅ أزرار التنقل
                            VStack(spacing: 10) {
                                settingsButton(title: " الإحصائيات", icon: "chart.bar.fill") {
                                    path.append(.statistics)
                                }

                                settingsButton(title: "مواقيت الصلاة", icon: "clock.fill") {
                                    path.append(.prayerTimes)
                                }

                                settingsButton(title: " الدعم الفني", icon: "questionmark.circle.fill") {
                                    path.append(.support)
                                }
                            }
                            .padding(.horizontal, 20)

                            Spacer().frame(height: 20)
                        }
                        .padding(.vertical, 10)
                    }
                }
                .navigationDestination(for: SettingsDestination.self) { destination in
                    switch destination {
                    case .statistics:
                        AdvancedStatisticsView(
                            istighfarCount: istighfarCount,
                            hawqalaCount: hawqalaCount,
                            salatCount: salatCount,
                            istighfarText: istighfarText,
                            hawqalaText: hawqalaText,
                            salatText: salatText,
                            isWarmLightOn: $isWarmLightOn,
                            selectedTheme: $selectedTheme
                        )
                    case .prayerTimes:
                        PrayerTimesView()
                    case .support:
                        SupportView(isWarmLightOn: $isWarmLightOn, selectedTheme: $selectedTheme)
                    }
                }
            }
        } else {
            // Fallback for earlier iOS versions if needed
            Text("هذا العرض يتطلب iOS 16.0 أو أحدث.")
        }
    }

    // ✅ زر إعدادات مخصص
    private func settingsButton(title: String, icon: String, action: @escaping () -> Void) -> some View {
        HStack {
            Spacer()
            Button(action: action) {
                HStack(spacing: 6) {
                    Image(systemName: icon)
                        .font(.system(size: 16, weight: .bold))
                    Text(title)
                }
            }
            .buttonStyle(CompactButtonStyle(isWarmLightOn: $isWarmLightOn, selectedTheme: selectedTheme))
        }
    }

    // ✅ حقل نص مخصص
    private func customTextField(title: String, text: Binding<String>) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(AppColor.secondary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn).opacity(0.2))
                .frame(height: 44)
                .shadow(color: .black.opacity(0.05), radius: 3)
            HStack {
                Image(systemName: "pencil")
                    .foregroundColor(AppColor.accent(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                TextField(title, text: text)
                    .font(.system(size: 14))
                    .foregroundColor(AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
            }
            .padding(.horizontal, 10)
        }
        .padding(.horizontal, 10)
    }
}
