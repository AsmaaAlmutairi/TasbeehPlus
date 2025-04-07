//___FILEHEADER___

/*import Foundation
import SwiftUI

struct Home: View {
    @State private var activeTab: Tab = .counter1
    @State private var isWarmLightOn = false
    @State private var selectedTheme = 1
    @State private var istighfarCount = 0
    @State private var hawqalaCount = 0
    @State private var salatCount = 0
    @State private var tabTexts: [Tab: String] = [
        .counter1: "",
        .counter2: "",
        .counter3: ""
    ]

    var body: some View {
        ZStack {
            AppColor.background(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn)
                .ignoresSafeArea()
                .animation(.easeInOut(duration: 0.5), value: isWarmLightOn)

            VStack(spacing: 15) {
                // Header Buttons
                HStack {
                    Button(action: changeTheme) {
                        IconButton(
                            icon: "paintbrush.fill",
                            color: AppColor.accent(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn)
                        )
                    }
                    
                    Spacer()
                    
                    Button(action: toggleLightMode) {
                        Image(systemName: isWarmLightOn ? "moon.fill" : "sun.max.fill")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding()
                            .background(
                                Circle()
                                    .fill(isWarmLightOn ? Color.gray.opacity(0.3) : Color.yellow.opacity(0.6))
                                    .shadow(radius: 5)
                            )
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 10)

                // Tab Views
                TabView(selection: $activeTab) {
                    // Counter 1
                    ZikrCounterView(
                        isWarmLightOn: $isWarmLightOn,
                        selectedTheme: $selectedTheme,
                        zikrText: Binding(
                            get: { tabTexts[.counter1] ?? "" },
                            set: { tabTexts[.counter1] = $0 }
                        ),
                        count: $istighfarCount
                    )
                    .tag(Tab.counter1)

                    // Counter 2
                    ZikrCounterView(
                        isWarmLightOn: $isWarmLightOn,
                        selectedTheme: $selectedTheme,
                        zikrText: Binding(
                            get: { tabTexts[.counter2] ?? "" },
                            set: { tabTexts[.counter2] = $0 }
                        ),
                        count: $hawqalaCount
                    )
                    .tag(Tab.counter2)

                    // Counter 3
                    ZikrCounterView(
                        isWarmLightOn: $isWarmLightOn,
                        selectedTheme: $selectedTheme,
                        zikrText: Binding(
                            get: { tabTexts[.counter3] ?? "" },
                            set: { tabTexts[.counter3] = $0 }
                        ),
                        count: $salatCount
                    )
                    .tag(Tab.counter3)

                    // Azkar View
                    AzkarView(
                        isWarmLightOn: $isWarmLightOn,
                        selectedTheme: $selectedTheme
                    )
                    .tag(Tab.azkar)

                    // Settings View
                    SettingsView(
                        isWarmLightOn: $isWarmLightOn,
                        selectedTheme: $selectedTheme,
                        istighfarCount: $istighfarCount,
                        hawqalaCount: $hawqalaCount,
                        salatCount: $salatCount,
                        istighfarText: Binding(
                            get: { tabTexts[.counter1] ?? "" },
                            set: { tabTexts[.counter1] = $0 }
                        ),
                        hawqalaText: Binding(
                            get: { tabTexts[.counter2] ?? "" },
                            set: { tabTexts[.counter2] = $0 }
                        ),
                        salatText: Binding(
                            get: { tabTexts[.counter3] ?? "" },
                            set: { tabTexts[.counter3] = $0 }
                        )
                    )
                    .tag(Tab.الإعدادات_المتقدمة)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))

                // Custom Tab Bar
                CustomTabBar(
                    activeTab: $activeTab,
                    isWarmLightOn: $isWarmLightOn,
                    selectedTheme: $selectedTheme,
                    tabTexts: $tabTexts
                )
                .padding(.bottom, 10)
            }
        }
        .animation(.easeInOut(duration: 0.3), value: selectedTheme)
    }

    private func changeTheme() {
        withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
            selectedTheme = (selectedTheme % 12) + 1
        }
    }

    private func toggleLightMode() {
        withAnimation(.easeInOut(duration: 0.5)) {
            isWarmLightOn.toggle()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}*/
/*import Foundation
import SwiftUI

struct Home: View {
    @State private var activeTab: Tab = .counter1
    @State private var isWarmLightOn = false
    @State private var selectedTheme = 1
    @State private var istighfarCount = 0
    @State private var hawqalaCount = 0
    @State private var salatCount = 0
    @State private var tabTexts: [Tab: String] = [
        .counter1: "",
        .counter2: "",
        .counter3: ""
    ]
    
    var body: some View {
        ZStack {
            AppColor.background(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn)
                .ignoresSafeArea()
                .animation(.easeInOut(duration: 0.5), value: isWarmLightOn)
            
            VStack(spacing: 15) {
                /*
                // شريط التحكم العلوي المحدث
                HStack(spacing: 20) {
                    Button(action: changeTheme) {
                        Image(systemName: "paintpalette.fill")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                            .frame(width: 50, height: 50)
                            .background(
                                BlurView(blurStyle: .systemMaterial)
                                    .clipShape(Circle())
                                    .overlay(
                                        Circle()
                                            .stroke(Color.white.opacity(0.2), lineWidth: 1)
                                    )
                                    .shadow(color: Color.black.opacity(0.3), radius: 8, x: 0, y: 4)
                            )
                    }
                    .buttonStyle(ScaleButtonStyle())
                    
                    Spacer()
                    
                    Button(action: toggleLightMode) {
                        Image(systemName: isWarmLightOn ? "moon.circle.fill" : "sun.max.circle.fill")
                            .symbolRenderingMode(.hierarchical)
                            .font(.system(size: 22, weight: .semibold))
                            .foregroundColor(isWarmLightOn ? .indigo : .orange)
                            .frame(width: 50, height: 50)
                            .background(
                                BlurView(blurStyle: .systemMaterial)
                                    .clipShape(Circle())
                                    .overlay(
                                        Circle()
                                            .stroke(Color.white.opacity(0.2), lineWidth: 1)
                                    )
                                    .shadow(color: Color.black.opacity(0.3), radius: 8, x: 0, y: 4)
                            )
                    }
                    .buttonStyle(ScaleButtonStyle())
                }
                /*.padding(.horizontal, 25)
              
                .padding(.vertical, 10)
                .background(
                    BlurView(blurStyle: .systemMaterial)
                        .clipShape(Capsule())
                        .overlay(
                            Capsule()
                                .stroke(Color.gray.opacity(0.1), lineWidth: 1)
                        )
                        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
                )
                .padding(.top, 15)
                .padding(.horizontal, 20)*/
                .padding(.horizontal, 20)
                .frame(height: 50) // تصغير الارتفاع
                .background(
                    BlurView(blurStyle: .systemUltraThinMaterial)
                        .clipShape(Capsule())
                        .overlay(
                            Capsule()
                                .stroke(Color.gray.opacity(0.1), lineWidth: 1)
                        )
                        .shadow(color: Color.black.opacity(0.05), radius: 8, x: 0, y: 5)
                )
                .padding(.top, 10)
                */
                // ✅ شريط التحكم العلوي المحدث
                HStack(spacing: 15) { // 🔹 تقليل التباعد بين الأزرار
                    Button(action: changeTheme) {
                        Image(systemName: "paintpalette.fill")
                            .font(.system(size: 18, weight: .semibold)) // 🔹 تقليل الحجم قليلًا
                            .foregroundColor(AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                            .frame(width: 40, height: 40) // 🔹 تقليل حجم الأزرار
                            .background(
                                BlurView(style: .systemMaterial)
                                    .clipShape(Circle())
                                    .overlay(
                                        Circle()
                                            .stroke(Color.white.opacity(0.2), lineWidth: 1)
                                    )
                                    .shadow(color: Color.black.opacity(0.3), radius: 6, x: 0, y: 3) // 🔹 تقليل الظل
                            )
                    }
                    .buttonStyle(ScaleButtonStyle())

                    Spacer()

                    Button(action: toggleLightMode) {
                        Image(systemName: isWarmLightOn ? "moon.circle.fill" : "sun.max.circle.fill")
                            .symbolRenderingMode(.hierarchical)
                            .font(.system(size: 18, weight: .semibold)) // 🔹 تصغير الأيقونة قليلًا
                            .foregroundColor(isWarmLightOn ? .indigo : .orange)
                            .frame(width: 40, height: 40) // 🔹 تقليل حجم الأزرار
                            .background(
                                BlurView(style: .systemMaterial)
                                    .clipShape(Circle())
                                    .overlay(
                                        Circle()
                                            .stroke(Color.white.opacity(0.2), lineWidth: 1)
                                    )
                                    .shadow(color: Color.black.opacity(0.3), radius: 6, x: 0, y: 3) // 🔹 تقليل الظل
                            )
                    }
                    .buttonStyle(ScaleButtonStyle())
                }
                .padding(.horizontal, 15) // 🔹 تقليل الـ padding الأفقي
                .frame(height: 40) // 🔹 تقليل ارتفاع الشريط العلوي
                .background(
                    BlurView(style: .systemUltraThinMaterial)
                        .clipShape(Capsule())
                        .overlay(
                            Capsule()
                                .stroke(Color.gray.opacity(0.1), lineWidth: 1)
                        )
                        .shadow(color: Color.black.opacity(0.05), radius: 6, x: 0, y: 3) // 🔹 تقليل الظل
                )
                .padding(.top, 5) // 🔹 تقليل المسافة العلوية

                // محتوى التطبيق الرئيسي
                TabView(selection: $activeTab) {
                    ZikrCounterView(
                        isWarmLightOn: $isWarmLightOn,
                        selectedTheme: $selectedTheme,
                        zikrText: Binding(
                            get: { tabTexts[.counter1] ?? "" },
                            set: { tabTexts[.counter1] = $0 }
                        ),
                        count: $istighfarCount
                    )
                    .tag(Tab.counter1)
                    
                    ZikrCounterView(
                        isWarmLightOn: $isWarmLightOn,
                        selectedTheme: $selectedTheme,
                        zikrText: Binding(
                            get: { tabTexts[.counter2] ?? "" },
                            set: { tabTexts[.counter2] = $0 }
                        ),
                        count: $hawqalaCount
                    )
                    .tag(Tab.counter2)
                    
                    ZikrCounterView(
                        isWarmLightOn: $isWarmLightOn,
                        selectedTheme: $selectedTheme,
                        zikrText: Binding(
                            get: { tabTexts[.counter3] ?? "" },
                            set: { tabTexts[.counter3] = $0 }
                        ),
                        count: $salatCount
                    )
                    .tag(Tab.counter3)
                    
                    AzkarView(
                        isWarmLightOn: $isWarmLightOn,
                        selectedTheme: $selectedTheme
                    )
                    .tag(Tab.azkar)
                    
                    SettingsView(
                        isWarmLightOn: $isWarmLightOn,
                        selectedTheme: $selectedTheme,
                        istighfarCount: $istighfarCount,
                        hawqalaCount: $hawqalaCount,
                        salatCount: $salatCount,
                        istighfarText: Binding(
                            get: { tabTexts[.counter1] ?? "" },
                            set: { tabTexts[.counter1] = $0 }
                        ),
                        hawqalaText: Binding(
                            get: { tabTexts[.counter2] ?? "" },
                            set: { tabTexts[.counter2] = $0 }
                        ),
                        salatText: Binding(
                            get: { tabTexts[.counter3] ?? "" },
                            set: { tabTexts[.counter3] = $0 }
                        )
                    )
                    .tag(Tab.الإعدادات_المتقدمة)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                // شريط التنقل السفلي
                CustomTabBar(
                    activeTab: $activeTab,
                    isWarmLightOn: $isWarmLightOn,
                    selectedTheme: $selectedTheme,
                    tabTexts: $tabTexts
                )
                .padding(.bottom, 10)
            }
        }
        .animation(.easeInOut(duration: 0.3), value: selectedTheme)
    }
    
    private func changeTheme() {
        withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
            selectedTheme = (selectedTheme % 12) + 1
        }
    }
    
    private func toggleLightMode() {
        withAnimation(.easeInOut(duration: 0.5)) {
            isWarmLightOn.toggle()
        }
    }
}

struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .opacity(configuration.isPressed ? 0.85 : 1.0)
            .animation(.spring(response: 0.3, dampingFraction: 0.7), value: configuration.isPressed)
    }
}

/*struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .opacity(configuration.isPressed ? 0.8 : 1.0)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}*/

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}*/


/*import Foundation
import SwiftUI
import WidgetKit

struct Home: View {
    @State private var activeTab: Tab = .counter1
    @State private var isWarmLightOn = false
    @State private var selectedTheme = 1
    @State private var istighfarCount = 0
    @State private var hawqalaCount = 0
    @State private var salatCount = 0
    @State private var tabTexts: [Tab: String] = [
        .counter1: "",
        .counter2: "",
        .counter3: ""
    ]
    
    var body: some View {
        ZStack {
            AppColor.background(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn)
                .ignoresSafeArea()
                .animation(.easeInOut(duration: 0.5), value: isWarmLightOn)
            
            VStack(spacing: 15) {
                HStack(spacing: 15) {
                    Button(action: changeTheme) {
                        Image(systemName: "paintpalette.fill")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                            .frame(width: 40, height: 40)
                            .background(
                                BlurView(style: .systemMaterial)
                                    .clipShape(Circle())
                            )
                    }
                    .buttonStyle(ScaleButtonStyle())

                    Spacer()

                    Button(action: toggleLightMode) {
                        Image(systemName: isWarmLightOn ? "moon.circle.fill" : "sun.max.circle.fill")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(isWarmLightOn ? .indigo : .orange)
                            .frame(width: 40, height: 40)
                            .background(
                                BlurView(style: .systemMaterial)
                                    .clipShape(Circle())
                            )
                    }
                    .buttonStyle(ScaleButtonStyle())
                }
                .padding(.horizontal, 15)
                .frame(height: 40)
                .background(
                    BlurView(style: .systemUltraThinMaterial)
                        .clipShape(Capsule())
                )
                .padding(.top, 5)

                TabView(selection: $activeTab) {
                    ZikrCounterView(
                        isWarmLightOn: $isWarmLightOn,
                        selectedTheme: $selectedTheme,
                        zikrText: Binding(
                            get: { tabTexts[.counter1] ?? "" },
                            set: { tabTexts[.counter1] = $0 }
                        ),
                        count: $istighfarCount
                    )
                    .tag(Tab.counter1)
                    
                    ZikrCounterView(
                        isWarmLightOn: $isWarmLightOn,
                        selectedTheme: $selectedTheme,
                        zikrText: Binding(
                            get: { tabTexts[.counter2] ?? "" },
                            set: { tabTexts[.counter2] = $0 }
                        ),
                        count: $hawqalaCount
                    )
                    .tag(Tab.counter2)
                    
                    ZikrCounterView(
                        isWarmLightOn: $isWarmLightOn,
                        selectedTheme: $selectedTheme,
                        zikrText: Binding(
                            get: { tabTexts[.counter3] ?? "" },
                            set: { tabTexts[.counter3] = $0 }
                        ),
                        count: $salatCount
                    )
                    .tag(Tab.counter3)
                    
                    AzkarView(
                        isWarmLightOn: $isWarmLightOn,
                        selectedTheme: $selectedTheme
                    )
                    .tag(Tab.azkar)
                    
                    SettingsView(
                        isWarmLightOn: $isWarmLightOn,
                        selectedTheme: $selectedTheme,
                        istighfarCount: $istighfarCount,
                        hawqalaCount: $hawqalaCount,
                        salatCount: $salatCount,
                        istighfarText: Binding(
                            get: { tabTexts[.counter1] ?? "" },
                            set: { tabTexts[.counter1] = $0 }
                        ),
                        hawqalaText: Binding(
                            get: { tabTexts[.counter2] ?? "" },
                            set: { tabTexts[.counter2] = $0 }
                        ),
                        salatText: Binding(
                            get: { tabTexts[.counter3] ?? "" },
                            set: { tabTexts[.counter3] = $0 }
                        )
                    )
                    .tag(Tab.الإعدادات_المتقدمة)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                CustomTabBar(
                    activeTab: $activeTab,
                    isWarmLightOn: $isWarmLightOn,
                    selectedTheme: $selectedTheme,
                    tabTexts: $tabTexts
                )
                .padding(.bottom, 10)
            }
        }
        .animation(.easeInOut(duration: 0.3), value: selectedTheme)
    }
    
    private func changeTheme() {
        withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
            selectedTheme = (selectedTheme % 12) + 1
        }
    }
    
    private func toggleLightMode() {
        withAnimation(.easeInOut(duration: 0.5)) {
            isWarmLightOn.toggle()
        }
    }
    private func updateZikrData() {
        UserDefaults.standard.setValue(tabTexts[activeTab] ?? "", forKey: "lastZikr")
        UserDefaults.standard.setValue(istighfarCount + hawqalaCount + salatCount, forKey: "zikrCount")

        WidgetCenter.shared.reloadAllTimelines()
    }
}*/
/*import Foundation
import SwiftUI
import WidgetKit

struct Home: View {
    @State private var activeTab: Tab = .counter1
    @State private var isWarmLightOn = false
    @State private var selectedTheme = 1
    @State private var istighfarCount = 0
    @State private var hawqalaCount = 0
    @State private var salatCount = 0
    @ObservedObject private var prayerManager = PrayerTimesManager()

    @State private var tabTexts: [Tab: String] = [
        .counter1: "",
        .counter2: "",
        .counter3: ""
    ]
    
    var body: some View {
        ZStack {
            AppColor.background(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn)
                .ignoresSafeArea()
                .animation(.easeInOut(duration: 0.5), value: isWarmLightOn)
            
            VStack(spacing: 15) {
                HStack(spacing: 15) {
                    Button(action: changeTheme) {
                        Image(systemName: "paintpalette.fill")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                            .frame(width: 40, height: 40)
                            .background(
                                BlurView(style: .systemMaterial)
                                    .clipShape(Circle())
                            )
                    }
                    .buttonStyle(ScaleButtonStyle())

                    Spacer()

                    Button(action: toggleLightMode) {
                        Image(systemName: isWarmLightOn ? "moon.circle.fill" : "sun.max.circle.fill")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(isWarmLightOn ? .indigo : .orange)
                            .frame(width: 40, height: 40)
                            .background(
                                BlurView(style: .systemMaterial)
                                    .clipShape(Circle())
                            )
                    }
                    .buttonStyle(ScaleButtonStyle())
                }
                .padding(.horizontal, 15)
                .frame(height: 40)
                .background(
                    BlurView(style: .systemUltraThinMaterial)
                        .clipShape(Capsule())
                )
                .padding(.top, 5)

                TabView(selection: $activeTab) {
                    ZikrCounterView(
                        isWarmLightOn: $isWarmLightOn,
                        selectedTheme: $selectedTheme,
                        zikrText: Binding(
                            get: { tabTexts[.counter1] ?? "" },
                            set: { tabTexts[.counter1] = $0 }
                        ),
                        count: $istighfarCount
                    )
                    .tag(Tab.counter1)
                    
                    ZikrCounterView(
                        isWarmLightOn: $isWarmLightOn,
                        selectedTheme: $selectedTheme,
                        zikrText: Binding(
                            get: { tabTexts[.counter2] ?? "" },
                            set: { tabTexts[.counter2] = $0 }
                        ),
                        count: $hawqalaCount
                    )
                    .tag(Tab.counter2)
                    
                    ZikrCounterView(
                        isWarmLightOn: $isWarmLightOn,
                        selectedTheme: $selectedTheme,
                        zikrText: Binding(
                            get: { tabTexts[.counter3] ?? "" },
                            set: { tabTexts[.counter3] = $0 }
                        ),
                        count: $salatCount
                    )
                    .tag(Tab.counter3)
                    
                    AzkarView(
                        isWarmLightOn: $isWarmLightOn,
                        selectedTheme: $selectedTheme
                    )
                    .tag(Tab.azkar)
                    
                    SettingsView(
                        isWarmLightOn: $isWarmLightOn,
                        selectedTheme: $selectedTheme,
                        istighfarCount: $istighfarCount,
                        hawqalaCount: $hawqalaCount,
                        salatCount: $salatCount,
                        istighfarText: Binding(
                            get: { tabTexts[.counter1] ?? "" },
                            set: { tabTexts[.counter1] = $0 }
                        ),
                        hawqalaText: Binding(
                            get: { tabTexts[.counter2] ?? "" },
                            set: { tabTexts[.counter2] = $0 }
                        ),
                        salatText: Binding(
                            get: { tabTexts[.counter3] ?? "" },
                            set: { tabTexts[.counter3] = $0 }
                        )
                    )
                    .tag(Tab.الإعدادات_المتقدمة)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                CustomTabBar(
                    activeTab: $activeTab,
                    isWarmLightOn: $isWarmLightOn,
                    selectedTheme: $selectedTheme,
                    tabTexts: $tabTexts
                )
                .padding(.bottom, 10)
            }
        }
        .onAppear {
            prayerManager.fetchPrayerTimes(latitude: 24.47, longitude: 39.61) // المدينة المنورة كمثال
        }
        .animation(.easeInOut(duration: 0.3), value: selectedTheme)
    }
    
    private func changeTheme() {
        withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
            selectedTheme = (selectedTheme % 12) + 1
        }
    }
    
    private func toggleLightMode() {
        withAnimation(.easeInOut(duration: 0.5)) {
            isWarmLightOn.toggle()
        }
    }
}*/
/*import Foundation
import SwiftUI
import WidgetKit

struct Home: View {
    @State private var activeTab: Tab = .counter1
    @State private var isWarmLightOn = false
    @State private var selectedTheme = 1
    
    // ✅ العدادات محفوظة باستخدام AppStorage
    @AppStorage("istighfarCount") private var persistentIstighfarCount = 0
    @AppStorage("hawqalaCount") private var persistentHawqalaCount = 0
    @AppStorage("salatCount") private var persistentSalatCount = 0
    
    // ✅ تستخدم للتفاعل اللحظي
    @State private var istighfarCount = 0
    @State private var hawqalaCount = 0
    @State private var salatCount = 0

    @ObservedObject private var prayerManager = PrayerTimesManager()

    @State private var tabTexts: [Tab: String] = [
       .counter1: "",
        .counter2: "",
       .counter3: ""
     
    ]
    
    var body: some View {
        ZStack {
            AppColor.background(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn)
                .ignoresSafeArea()
                .animation(.easeInOut(duration: 0.5), value: isWarmLightOn)
            
            VStack(spacing: 15) {
                HStack(spacing: 15) {
                    Button(action: changeTheme) {
                        Image(systemName: "paintpalette.fill")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                            .frame(width: 40, height: 40)
                            .background(
                                BlurView(style: .systemMaterial)
                                    .clipShape(Circle())
                            )
                    }
                    .buttonStyle(ScaleButtonStyle())

                    Spacer()

                    Button(action: toggleLightMode) {
                        Image(systemName: isWarmLightOn ? "moon.circle.fill" : "sun.max.circle.fill")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(isWarmLightOn ? .indigo : .orange)
                            .frame(width: 40, height: 40)
                            .background(
                                BlurView(style: .systemMaterial)
                                    .clipShape(Circle())
                            )
                    }
                    .buttonStyle(ScaleButtonStyle())
                }
                .padding(.horizontal, 15)
                .frame(height: 40)
                .background(
                    BlurView(style: .systemUltraThinMaterial)
                        .clipShape(Capsule())
                )
                .padding(.top, 5)

                TabView(selection: $activeTab) {
                    ZikrCounterView(
                        isWarmLightOn: $isWarmLightOn,
                        selectedTheme: $selectedTheme,
                        
                      

                        zikrText: Binding(
                            get: { tabTexts[.counter1] ?? "" },
                            set: { tabTexts[.counter1] = $0 }
                        ),
                        count: Binding(
                            get: { istighfarCount },
                            set: {
                                istighfarCount = $0
                                persistentIstighfarCount = $0 // ✅ حفظ القيمة
                            }
                        )
                    )
                    .tag(Tab.counter1)
                    
                    ZikrCounterView(
                        isWarmLightOn: $isWarmLightOn,
                        selectedTheme: $selectedTheme,
                        
                       
                       

                      zikrText: Binding(
                            get: { tabTexts[.counter2] ?? "" },
                            set: { tabTexts[.counter2] = $0 }
                        ),
                        count: Binding(
                            get: { hawqalaCount },
                            set: {
                                hawqalaCount = $0
                                persistentHawqalaCount = $0 // ✅ حفظ القيمة
                            }
                        )
                    )
                    .tag(Tab.counter2)
                    
                    ZikrCounterView(
                        isWarmLightOn: $isWarmLightOn,
                        selectedTheme: $selectedTheme,
                        
                        
                        zikrText: Binding(
                            get: { tabTexts[.counter3] ?? "" },
                            set: { tabTexts[.counter3] = $0 }
                        ),
                        count: Binding(
                            get: { salatCount },
                            set: {
                                salatCount = $0
                                persistentSalatCount = $0 // ✅ حفظ القيمة
                            }
                        )
                    )
                    .tag(Tab.counter3)
                    
                    AzkarView(
                        isWarmLightOn: $isWarmLightOn,
                        selectedTheme: $selectedTheme
                    )
                    .tag(Tab.azkar)
                    
                    SettingsView(
                        isWarmLightOn: $isWarmLightOn,
                        selectedTheme: $selectedTheme,
                        istighfarCount: $istighfarCount,
                        hawqalaCount: $hawqalaCount,
                        salatCount: $salatCount,
                        istighfarText: Binding(
                            get: { tabTexts[.counter1] ?? "" },
                            set: { tabTexts[.counter1] = $0 }
                        ),
                        hawqalaText: Binding(
                            get: { tabTexts[.counter2] ?? "" },
                            set: { tabTexts[.counter2] = $0 }
                        ),
                        salatText: Binding(
                            get: { tabTexts[.counter3] ?? "" },
                            set: { tabTexts[.counter3] = $0 }
                        )
                    )
                    .tag(Tab.الإعدادات_المتقدمة)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                CustomTabBar(
                    activeTab: $activeTab,
                    isWarmLightOn: $isWarmLightOn,
                    selectedTheme: $selectedTheme,
                    tabTexts: $tabTexts
                )
                .padding(.bottom, 10)
            }
        }
        .onAppear {
            // ✅ تحميل القيم المحفوظة عند فتح التطبيق
            istighfarCount = persistentIstighfarCount
            hawqalaCount = persistentHawqalaCount
            salatCount = persistentSalatCount
            
            prayerManager.fetchPrayerTimes(latitude: 24.47, longitude: 39.61) // المدينة المنورة كمثال
        }
        .animation(.easeInOut(duration: 0.3), value: selectedTheme)
    }
    
    private func changeTheme() {
        withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
            selectedTheme = (selectedTheme % 12) + 1
        }
    }
    
    private func toggleLightMode() {
        withAnimation(.easeInOut(duration: 0.5)) {
            isWarmLightOn.toggle()
        }
    }
}*/

import Foundation
import SwiftUI
import WidgetKit

struct Home: View {
    @State private var activeTab: Tab = .counter1
    @State private var isWarmLightOn = false
    @State private var selectedTheme = 1

    @AppStorage("istighfarCount") private var persistentIstighfarCount = 0
    @AppStorage("hawqalaCount") private var persistentHawqalaCount = 0
    @AppStorage("salatCount") private var persistentSalatCount = 0

    @AppStorage("counter1Text") private var counter1Text = ""
    @AppStorage("counter2Text") private var counter2Text = ""
    @AppStorage("counter3Text") private var counter3Text = ""

    @State private var istighfarCount = 0
    @State private var hawqalaCount = 0
    @State private var salatCount = 0

    @ObservedObject private var prayerManager = PrayerTimesManager()

    var body: some View {
        ZStack {
            AppColor.background(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn)
                .ignoresSafeArea()
                .animation(.easeInOut(duration: 0.5), value: isWarmLightOn)

            VStack(spacing: 15) {
                HStack(spacing: 15) {
                    Button(action: changeTheme) {
                        Image(systemName: "paintpalette.fill")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                            .frame(width: 40, height: 40)
                            .background(BlurView(style: .systemMaterial).clipShape(Circle()))
                    }
                    .buttonStyle(ScaleButtonStyle())

                    Spacer()

                    Button(action: toggleLightMode) {
                        Image(systemName: isWarmLightOn ? "moon.circle.fill" : "sun.max.circle.fill")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(isWarmLightOn ? .indigo : .orange)
                            .frame(width: 40, height: 40)
                            .background(BlurView(style: .systemMaterial).clipShape(Circle()))
                    }
                    .buttonStyle(ScaleButtonStyle())
                }
                .padding(.horizontal, 15)
                .frame(height: 40)
                .background(BlurView(style: .systemUltraThinMaterial).clipShape(Capsule()))
                .padding(.top, 5)

                TabView(selection: $activeTab) {
                    ZikrCounterView(
                        isWarmLightOn: $isWarmLightOn,
                        selectedTheme: $selectedTheme,
                        zikrText: $counter1Text,
                        count: Binding(
                            get: { istighfarCount },
                            set: {
                                istighfarCount = $0
                                persistentIstighfarCount = $0
                            }
                        )
                    ).tag(Tab.counter1)

                    ZikrCounterView(
                        isWarmLightOn: $isWarmLightOn,
                        selectedTheme: $selectedTheme,
                        zikrText: $counter2Text,
                        count: Binding(
                            get: { hawqalaCount },
                            set: {
                                hawqalaCount = $0
                                persistentHawqalaCount = $0
                            }
                        )
                    ).tag(Tab.counter2)

                    ZikrCounterView(
                        isWarmLightOn: $isWarmLightOn,
                        selectedTheme: $selectedTheme,
                        zikrText: $counter3Text,
                        count: Binding(
                            get: { salatCount },
                            set: {
                                salatCount = $0
                                persistentSalatCount = $0
                            }
                        )
                    ).tag(Tab.counter3)

                    AzkarView(
                        isWarmLightOn: $isWarmLightOn,
                        selectedTheme: $selectedTheme
                    ).tag(Tab.azkar)

                    SettingsView(
                        isWarmLightOn: $isWarmLightOn,
                        selectedTheme: $selectedTheme,
                        istighfarCount: $istighfarCount,
                        hawqalaCount: $hawqalaCount,
                        salatCount: $salatCount
                    ).tag(Tab.الإعدادات_المتقدمة)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))

                CustomTabBar(
                    activeTab: $activeTab,
                    isWarmLightOn: $isWarmLightOn,
                    selectedTheme: $selectedTheme
                )
                .padding(.bottom, 10)
            }
        }
        .onAppear {
            istighfarCount = persistentIstighfarCount
            hawqalaCount = persistentHawqalaCount
            salatCount = persistentSalatCount

            prayerManager.fetchPrayerTimes(latitude: 24.47, longitude: 39.61)
        }
        .animation(.easeInOut(duration: 0.3), value: selectedTheme)
    }

    private func changeTheme() {
        withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
            selectedTheme = (selectedTheme % 14) + 1
        }
    }

    private func toggleLightMode() {
        withAnimation(.easeInOut(duration: 0.5)) {
            isWarmLightOn.toggle()
        }
    }
}
