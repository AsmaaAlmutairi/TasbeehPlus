//
//  PrayerTimesView.swift
//  Tasbeeh+ | تسبيح
//
//  Created by A Sky on 13/09/1446 AH.
//


/*import SwiftUI
import Adhan
import Foundation

struct PrayerTimesView: View {
    @ObservedObject var prayerManager = PrayerTimesManager()
    @State private var useCurrentLocation = true
    @State private var selectedCity: City? = nil
    @State private var is24HourFormat = true
    @State private var showCityPicker = false

    var body: some View {
        VStack(spacing: 15) {
            Text("🕌 مواقيت الصلاة")
                .font(.largeTitle.bold())

            Toggle("استخدام الموقع الحالي", isOn: $useCurrentLocation)
                .padding()
                .onChange(of: useCurrentLocation) { isUsingLocation in
                    if isUsingLocation {
                        selectedCity = nil
                        if let loc = LocationManager.shared.currentLocation {
                            prayerManager.fetchPrayerTimes(latitude: loc.coordinate.latitude,
                                                           longitude: loc.coordinate.longitude)
                        }
                    }
                }

            if !useCurrentLocation {
                Button(action: {
                    showCityPicker.toggle()
                }) {
                    Text(selectedCity?.name ?? "اختر مدينة")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .padding(.vertical, 8)
                }
            }
            Button(action: {
                if useCurrentLocation {
                    if let loc = LocationManager.shared.currentLocation {
                        prayerManager.fetchPrayerTimes(latitude: loc.coordinate.latitude, longitude: loc.coordinate.longitude)
                    }
                } else if let city = selectedCity {
                    prayerManager.fetchPrayerTimes(latitude: city.latitude, longitude: city.longitude)
                }
            }) {
                HStack {
                    Image(systemName: "arrow.clockwise") // ✅ أيقونة تحديث
                    Text("تحديث المواقيت")
                        .font(.headline)
                }
                .foregroundColor(.blue)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
            }


            // ✅ إضافة التاريخ الهجري والميلادي بدون عناوين
            VStack(spacing: 4) {
                Text(prayerManager.hijriDate)
                    .font(.system(.title3, design: .rounded))
                    .foregroundColor(.primary)
                
                Text(prayerManager.gregorianDate)
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundColor(.secondary)
            }
            .font(.headline)

            Text("تنسيق الوقت:")
                .font(.headline)

            Picker("", selection: $is24HourFormat) {
                Text("12h").tag(false)
                Text("24h").tag(true)
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(width: 150)

            List {
                ForEach(prayerManager.sortedPrayerTimes(is24HourFormat: is24HourFormat), id: \.key) { name, time in
                    HStack {
                        Image(systemName: iconName(for: name)) // ✅ إضافة أيقونة لكل صلاة
                            .foregroundColor(.blue)
                        Text(prayerName(for: name)) // ✅ اسم الصلاة بالعربي
                            .font(.headline)
                        Spacer()
                        Text(time) // ✅ وقت الصلاة
                            .font(.headline)
                    }
                }
            }
            .listStyle(PlainListStyle()) // ✅ تحسين الشكل


            if let nextPrayer = prayerManager.nextPrayer {
                VStack {
                    Text("باقي على الصلاة القادمة")
                        .font(.headline)
                    Text("\(prayerName(for: nextPrayer.name)) بعد \(prayerManager.timeRemaining)")
                        .font(.title2.bold())
                        .foregroundColor(.blue)
                }
                .padding(.vertical, 10)
            }

        }
        .onAppear {
            if useCurrentLocation {
                if let loc = LocationManager.shared.currentLocation {
                    prayerManager.fetchPrayerTimes(latitude: loc.coordinate.latitude, longitude: loc.coordinate.longitude)
                } else {
                    LocationManager.shared.requestLocation()
                }
            } else if let city = selectedCity {
                prayerManager.fetchPrayerTimes(latitude: city.latitude, longitude: city.longitude)
            }
        }
        .sheet(isPresented: $showCityPicker) {
            CityPickerView(selectedCity: $selectedCity, prayerManager: prayerManager)
        }
        //تحديث أوقات الصلاة بمجرد توفر الموقع، حتى لو تأخر تحميله.
        .onReceive(LocationManager.shared.$currentLocation.compactMap { $0 }) { loc in
            if useCurrentLocation {
                prayerManager.fetchPrayerTimes(latitude: loc.coordinate.latitude, longitude: loc.coordinate.longitude)
            }
        }

    }
    

    private func iconName(for prayer: String) -> String {
        switch prayer {
        case "Fajr": return "moon.stars.fill"
        case "Sunrise": return "sunrise.fill"
        case "Dhuhr": return "sun.max.fill"
        case "Asr": return "sun.dust.fill"
        case "Maghrib": return "sunset.fill"
        case "Isha": return "moon.fill"
        default: return "clock.fill"
        }
    }


    private func prayerName(for prayer: String) -> String {
        switch prayer {
        case "Fajr": return "الفجر"
        case "Sunrise": return "الشروق"
        case "Dhuhr": return "الظهر"
        case "Asr": return "العصر"
        case "Maghrib": return "المغرب"
        case "Isha": return "العشاء"
        default: return prayer
        }
    }
}*/
/*import SwiftUI
import Adhan
import Foundation

struct PrayerTimesView: View {
    @ObservedObject var prayerManager = PrayerTimesManager()
    @State private var useCurrentLocation = true
    @State private var selectedCity: City? = nil
    @State private var is24HourFormat = true
    @State private var showCityPicker = false

    @Environment(\.dismiss) private var dismiss // ✅ زر الرجوع اليدوي

    var body: some View {
        VStack(spacing: 15) {
            Text("🕌 مواقيت الصلاة")
                .font(.largeTitle.bold())

            Toggle("استخدام الموقع الحالي", isOn: $useCurrentLocation)
                .padding()
                .onChange(of: useCurrentLocation) { isUsingLocation in
                    if isUsingLocation {
                        selectedCity = nil
                        if let loc = LocationManager.shared.currentLocation {
                            prayerManager.fetchPrayerTimes(
                                latitude: loc.coordinate.latitude,
                                longitude: loc.coordinate.longitude
                            )
                        }
                    }
                }

            if !useCurrentLocation {
                Button(action: {
                    showCityPicker.toggle()
                }) {
                    Text(selectedCity?.name ?? "اختر مدينة")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .padding(.vertical, 8)
                }
            }

            Button(action: {
                if useCurrentLocation {
                    if let loc = LocationManager.shared.currentLocation {
                        prayerManager.fetchPrayerTimes(latitude: loc.coordinate.latitude, longitude: loc.coordinate.longitude)
                    }
                } else if let city = selectedCity {
                    prayerManager.fetchPrayerTimes(latitude: city.latitude, longitude: city.longitude)
                }
            }) {
                HStack {
                    Image(systemName: "arrow.clockwise")
                    Text("تحديث المواقيت")
                        .font(.headline)
                }
                .foregroundColor(.blue)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
            }

            VStack(spacing: 4) {
                Text(prayerManager.hijriDate)
                    .font(.system(.title3, design: .rounded))
                    .foregroundColor(.primary)

                Text(prayerManager.gregorianDate)
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundColor(.secondary)
            }

            Text("تنسيق الوقت:")
                .font(.headline)

            Picker("", selection: $is24HourFormat) {
                Text("12h").tag(false)
                Text("24h").tag(true)
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(width: 150)

            List {
                ForEach(prayerManager.sortedPrayerTimes(is24HourFormat: is24HourFormat), id: \.key) { name, time in
                    HStack {
                        Image(systemName: iconName(for: name))
                            .foregroundColor(.blue)
                        Text(prayerName(for: name))
                            .font(.headline)
                        Spacer()
                        Text(time)
                            .font(.headline)
                    }
                }
            }
            .listStyle(PlainListStyle())

            if let nextPrayer = prayerManager.nextPrayer {
                VStack {
                    Text("باقي على الصلاة القادمة")
                        .font(.headline)
                    Text("\(prayerName(for: nextPrayer.name)) بعد \(prayerManager.timeRemaining)")
                        .font(.title2.bold())
                        .foregroundColor(.blue)
                }
                .padding(.vertical, 10)
            }
        }
        .padding()
        .onAppear {
            if useCurrentLocation {
                if let loc = LocationManager.shared.currentLocation {
                    prayerManager.fetchPrayerTimes(latitude: loc.coordinate.latitude, longitude: loc.coordinate.longitude)
                } else {
                    LocationManager.shared.requestLocation()
                }
            } else if let city = selectedCity {
                prayerManager.fetchPrayerTimes(latitude: city.latitude, longitude: city.longitude)
            }
        }
        .sheet(isPresented: $showCityPicker) {
            CityPickerView(selectedCity: $selectedCity, prayerManager: prayerManager)
        }
        .onReceive(LocationManager.shared.$currentLocation.compactMap { $0 }) { loc in
            if useCurrentLocation {
                prayerManager.fetchPrayerTimes(latitude: loc.coordinate.latitude, longitude: loc.coordinate.longitude)
            }
        }

        // ✅ زر الرجوع الاحترافي
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.backward")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.blue)
                        .padding(8)
                }
            }
        }
    }

    private func iconName(for prayer: String) -> String {
        switch prayer {
        case "Fajr": return "moon.stars.fill"
        case "Sunrise": return "sunrise.fill"
        case "Dhuhr": return "sun.max.fill"
        case "Asr": return "sun.dust.fill"
        case "Maghrib": return "sunset.fill"
        case "Isha": return "moon.fill"
        default: return "clock.fill"
        }
    }

    private func prayerName(for prayer: String) -> String {
        switch prayer {
        case "Fajr": return "الفجر"
        case "Sunrise": return "الشروق"
        case "Dhuhr": return "الظهر"
        case "Asr": return "العصر"
        case "Maghrib": return "المغرب"
        case "Isha": return "العشاء"
        default: return prayer
        }
    }
}*/
/*import SwiftUI
import Adhan
import Foundation

struct PrayerTimesView: View {
    @ObservedObject var prayerManager = PrayerTimesManager()
    @State private var useCurrentLocation = true
    @State private var selectedCity: City? = nil
    @State private var is24HourFormat = true
    @State private var showCityPicker = false

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                // ✅ زر الرجوع كأيقونة فقط
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.backward")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.blue)
                            .padding(8)
                    }
                    Spacer()
                }

                Text("🕌 مواقيت الصلاة")
                    .font(.largeTitle.bold())

                Toggle("استخدام الموقع الحالي", isOn: $useCurrentLocation)
                    .padding(.horizontal)
                    .onChange(of: useCurrentLocation) { isUsingLocation in
                        if isUsingLocation {
                            selectedCity = nil
                            if let loc = LocationManager.shared.currentLocation {
                                prayerManager.fetchPrayerTimes(
                                    latitude: loc.coordinate.latitude,
                                    longitude: loc.coordinate.longitude
                                )
                            }
                        }
                    }

                if !useCurrentLocation {
                    Button(action: {
                        showCityPicker.toggle()
                    }) {
                        Text(selectedCity?.name ?? "اختر مدينة")
                            .font(.headline)
                            .foregroundColor(.blue)
                            .padding(.vertical, 8)
                    }
                }

                Button(action: {
                    if useCurrentLocation {
                        if let loc = LocationManager.shared.currentLocation {
                            prayerManager.fetchPrayerTimes(latitude: loc.coordinate.latitude, longitude: loc.coordinate.longitude)
                        }
                    } else if let city = selectedCity {
                        prayerManager.fetchPrayerTimes(latitude: city.latitude, longitude: city.longitude)
                    }
                }) {
                    HStack {
                        Image(systemName: "arrow.clockwise")
                        Text("تحديث المواقيت")
                            .font(.headline)
                    }
                    .foregroundColor(.blue)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                }

                // ✅ التاريخين
                VStack(spacing: 4) {
                    Text(prayerManager.hijriDate)
                        .font(.system(.title3, design: .rounded))
                        .foregroundColor(.primary)
                    Text(prayerManager.gregorianDate)
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundColor(.secondary)
                }

                Text("تنسيق الوقت:")
                    .font(.headline)

                Picker("", selection: $is24HourFormat) {
                    Text("12h").tag(false)
                    Text("24h").tag(true)
                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: 150)

                // ✅ قائمة مواقيت الصلاة بدون List (لأخذ أقل مساحة)
                VStack(spacing: 8) {
                    ForEach(prayerManager.sortedPrayerTimes(is24HourFormat: is24HourFormat), id: \.key) { name, time in
                        HStack {
                            Image(systemName: iconName(for: name))
                                .foregroundColor(.blue)
                            Text(prayerName(for: name))
                                .font(.headline)
                            Spacer()
                            Text(time)
                                .font(.headline)
                        }
                        .padding(.horizontal)
                        Divider()
                    }
                }
                .padding(.top, 8)

                // ✅ عداد الصلاة القادمة
                if let nextPrayer = prayerManager.nextPrayer {
                    VStack(spacing: 4) {
                        Text("باقي على الصلاة القادمة")
                            .font(.headline)
                        Text("\(prayerName(for: nextPrayer.name)) بعد \(prayerManager.timeRemaining)")
                            .font(.title3.bold())
                            .foregroundColor(.blue)
                    }
                    .padding(.top, 10)
                }

                Spacer().frame(minHeight: 30)


            }
            .padding()
        }
        .onAppear {
            if useCurrentLocation {
                if let loc = LocationManager.shared.currentLocation {
                    prayerManager.fetchPrayerTimes(latitude: loc.coordinate.latitude, longitude: loc.coordinate.longitude)
                } else {
                    LocationManager.shared.requestLocation()
                }
            } else if let city = selectedCity {
                prayerManager.fetchPrayerTimes(latitude: city.latitude, longitude: city.longitude)
            }
        }
        .sheet(isPresented: $showCityPicker) {
            CityPickerView(selectedCity: $selectedCity, prayerManager: prayerManager)
        }
        .onReceive(LocationManager.shared.$currentLocation.compactMap { $0 }) { loc in
            if useCurrentLocation {
                prayerManager.fetchPrayerTimes(latitude: loc.coordinate.latitude, longitude: loc.coordinate.longitude)
            }
        }
    }

    private func iconName(for prayer: String) -> String {
        switch prayer {
        case "Fajr": return "moon.stars.fill"
        case "Sunrise": return "sunrise.fill"
        case "Dhuhr": return "sun.max.fill"
        case "Asr": return "sun.dust.fill"
        case "Maghrib": return "sunset.fill"
        case "Isha": return "moon.fill"
        default: return "clock.fill"
        }
    }

    private func prayerName(for prayer: String) -> String {
        switch prayer {
        case "Fajr": return "الفجر"
        case "Sunrise": return "الشروق"
        case "Dhuhr": return "الظهر"
        case "Asr": return "العصر"
        case "Maghrib": return "المغرب"
        case "Isha": return "العشاء"
        default: return prayer
        }
    }
}*/
/*import SwiftUI
import Adhan
import Foundation

struct PrayerTimesView: View {
    @ObservedObject var prayerManager = PrayerTimesManager()
    @State private var useCurrentLocation = true
    @State private var selectedCity: City? = nil
    @State private var is24HourFormat = true
    @State private var showCityPicker = false

    @Environment(\.dismiss) private var dismiss // ✅ زر الرجوع

    var body: some View {
        VStack(spacing: 16) {
            // ✅ العنوان
            Text("🕌 مواقيت الصلاة")
                .font(.largeTitle.bold())
                .padding(.top, 8)

            // ✅ زر الرجوع الاحترافي
            HStack {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.backward")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.blue)
                        .padding(8)
                }
                Spacer()
            }
            .padding(.horizontal)

            // ✅ الموقع
            Toggle("استخدام الموقع الحالي", isOn: $useCurrentLocation)
                .padding(.horizontal)

            if !useCurrentLocation {
                Button(action: {
                    showCityPicker.toggle()
                }) {
                    Text(selectedCity?.name ?? "اختر مدينة")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .padding(.vertical, 8)
                }
            }

            // ✅ زر التحديث
            Button(action: {
                if useCurrentLocation {
                    if let loc = LocationManager.shared.currentLocation {
                        prayerManager.fetchPrayerTimes(latitude: loc.coordinate.latitude, longitude: loc.coordinate.longitude)
                    }
                } else if let city = selectedCity {
                    prayerManager.fetchPrayerTimes(latitude: city.latitude, longitude: city.longitude)
                }
            }) {
                HStack {
                    Image(systemName: "arrow.clockwise")
                    Text("تحديث المواقيت")
                        .font(.headline)
                }
                .foregroundColor(.blue)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
            }

            // ✅ التاريخ
            VStack(spacing: 4) {
                Text(prayerManager.hijriDate)
                    .font(.system(.title3, design: .rounded))
                    .foregroundColor(.primary)

                Text(prayerManager.gregorianDate)
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundColor(.secondary)
            }

            // ✅ تنسيق الوقت
            VStack(spacing: 4) {
                Text("تنسيق الوقت:")
                    .font(.headline)

                Picker("", selection: $is24HourFormat) {
                    Text("12h").tag(false)
                    Text("24h").tag(true)
                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: 150)
            }

            // ✅ قائمة الصلوات
            List {
                ForEach(prayerManager.sortedPrayerTimes(is24HourFormat: is24HourFormat), id: \.key) { name, time in
                    HStack {
                        Image(systemName: iconName(for: name))
                            .foregroundColor(.blue)
                        Text(prayerName(for: name))
                            .font(.headline)
                        Spacer()
                        Text(time)
                            .font(.headline)
                    }
                    .padding(.vertical, 4)
                }
            }
            .frame(height: 300) // ⬅️ لضبط طول القائمة حتى تظهر الصلوات بوضوح
            .listStyle(PlainListStyle())

            // ✅ الصلاة القادمة
            if let nextPrayer = prayerManager.nextPrayer {
                VStack(spacing: 4) {
                    Text("باقي على الصلاة القادمة")
                        .font(.headline)
                    Text("\(prayerName(for: nextPrayer.name)) بعد \(prayerManager.timeRemaining)")
                        .font(.title2.bold())
                        .foregroundColor(.blue)
                }
                .padding(.vertical, 10)
            }

            Spacer().frame(height: 20) // ⬅️ مسافة أسفل الصفحة
        }
        .padding(.bottom, 10)
        .onAppear {
            if useCurrentLocation {
                if let loc = LocationManager.shared.currentLocation {
                    prayerManager.fetchPrayerTimes(latitude: loc.coordinate.latitude, longitude: loc.coordinate.longitude)
                } else {
                    LocationManager.shared.requestLocation()
                }
            } else if let city = selectedCity {
                prayerManager.fetchPrayerTimes(latitude: city.latitude, longitude: city.longitude)
            }
        }
        .sheet(isPresented: $showCityPicker) {
            CityPickerView(selectedCity: $selectedCity, prayerManager: prayerManager)
        }
        .onReceive(LocationManager.shared.$currentLocation.compactMap { $0 }) { loc in
            if useCurrentLocation {
                prayerManager.fetchPrayerTimes(latitude: loc.coordinate.latitude, longitude: loc.coordinate.longitude)
            }
        }
        .navigationBarBackButtonHidden(true) // ✅ إخفاء زر الرجوع الافتراضي
    }

    private func iconName(for prayer: String) -> String {
        switch prayer {
        case "Fajr": return "moon.stars.fill"
        case "Sunrise": return "sunrise.fill"
        case "Dhuhr": return "sun.max.fill"
        case "Asr": return "sun.dust.fill"
        case "Maghrib": return "sunset.fill"
        case "Isha": return "moon.fill"
        default: return "clock.fill"
        }
    }

    private func prayerName(for prayer: String) -> String {
        switch prayer {
        case "Fajr": return "الفجر"
        case "Sunrise": return "الشروق"
        case "Dhuhr": return "الظهر"
        case "Asr": return "العصر"
        case "Maghrib": return "المغرب"
        case "Isha": return "العشاء"
        default: return prayer
        }
    }
}*/
/*import SwiftUI
import Adhan
import Foundation

struct PrayerTimesView: View {
    @ObservedObject var prayerManager = PrayerTimesManager()
    @State private var useCurrentLocation = true
    @State private var selectedCity: City? = nil
    @State private var is24HourFormat = true
    @State private var showCityPicker = false

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            Color(.systemBackground).ignoresSafeArea()

            VStack(spacing: 20) {
                // زر الرجوع
                HStack {
                    Button(action: { dismiss() }) {
                        Image(systemName: "chevron.backward")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.blue)
                            .padding(10)
                    }
                    Spacer()
                }

                // العنوان
                Text("🕌 مواقيت الصلاة")
                    .font(.largeTitle.bold())
                    .padding(.bottom, 5)

                // الموقع واختيار المدينة
                VStack(spacing: 10) {
                    Toggle("استخدام الموقع الحالي", isOn: $useCurrentLocation)
                        .onChange(of: useCurrentLocation) { isUsing in
                            if isUsing {
                                selectedCity = nil
                                if let loc = LocationManager.shared.currentLocation {
                                    prayerManager.fetchPrayerTimes(
                                        latitude: loc.coordinate.latitude,
                                        longitude: loc.coordinate.longitude
                                    )
                                }
                            }
                        }

                    if !useCurrentLocation {
                        Button(action: { showCityPicker.toggle() }) {
                            Text(selectedCity?.name ?? "اختر مدينة")
                                .foregroundColor(.blue)
                                .font(.headline)
                        }
                    }

                    Button(action: {
                        if useCurrentLocation {
                            if let loc = LocationManager.shared.currentLocation {
                                prayerManager.fetchPrayerTimes(latitude: loc.coordinate.latitude, longitude: loc.coordinate.longitude)
                            }
                        } else if let city = selectedCity {
                            prayerManager.fetchPrayerTimes(latitude: city.latitude, longitude: city.longitude)
                        }
                    }) {
                        HStack {
                            Image(systemName: "arrow.clockwise")
                            Text("تحديث المواقيت")
                        }
                        .font(.headline)
                        .foregroundColor(.blue)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                    }
                }

                // التاريخ
                VStack(spacing: 4) {
                    Text(prayerManager.hijriDate)
                        .font(.title3)
                    Text(prayerManager.gregorianDate)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                // تنسيق الوقت
                VStack(spacing: 8) {
                    Text("تنسيق الوقت:")
                        .font(.headline)

                    Picker("", selection: $is24HourFormat) {
                        Text("12h").tag(false)
                        Text("24h").tag(true)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 150)
                }

                // قائمة الصلوات
                VStack(spacing: 12) {
                    ForEach(prayerManager.sortedPrayerTimes(is24HourFormat: is24HourFormat), id: \.key) { name, time in
                        HStack {
                            Image(systemName: iconName(for: name))
                                .foregroundColor(.blue)
                            Text(prayerName(for: name))
                                .font(.headline)
                            Spacer()
                            Text(time)
                                .font(.headline)
                        }
                        .padding(.horizontal)
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.systemGray6))
                )

                // الوقت المتبقي
                if let nextPrayer = prayerManager.nextPrayer {
                    VStack {
                        Text("باقي على الصلاة القادمة")
                            .font(.headline)
                        Text("\(prayerName(for: nextPrayer.name)) بعد \(prayerManager.timeRemaining)")
                            .font(.title2.bold())
                            .foregroundColor(.blue)
                    }
                    .padding(.top, 10)
                }

                Spacer(minLength: 30)
            }
            .padding()
        }
        .sheet(isPresented: $showCityPicker) {
            CityPickerView(selectedCity: $selectedCity, prayerManager: prayerManager)
        }
        .onAppear {
            if useCurrentLocation {
                if let loc = LocationManager.shared.currentLocation {
                    prayerManager.fetchPrayerTimes(latitude: loc.coordinate.latitude, longitude: loc.coordinate.longitude)
                } else {
                    LocationManager.shared.requestLocation()
                }
            } else if let city = selectedCity {
                prayerManager.fetchPrayerTimes(latitude: city.latitude, longitude: city.longitude)
            }
        }
        .onReceive(LocationManager.shared.$currentLocation.compactMap { $0 }) { loc in
            if useCurrentLocation {
                prayerManager.fetchPrayerTimes(latitude: loc.coordinate.latitude, longitude: loc.coordinate.longitude)
            }
        }
    }

    private func iconName(for prayer: String) -> String {
        switch prayer {
        case "Fajr": return "moon.stars.fill"
        case "Sunrise": return "sunrise.fill"
        case "Dhuhr": return "sun.max.fill"
        case "Asr": return "sun.dust.fill"
        case "Maghrib": return "sunset.fill"
        case "Isha": return "moon.fill"
        default: return "clock.fill"
        }
    }

    private func prayerName(for prayer: String) -> String {
        switch prayer {
        case "Fajr": return "الفجر"
        case "Sunrise": return "الشروق"
        case "Dhuhr": return "الظهر"
        case "Asr": return "العصر"
        case "Maghrib": return "المغرب"
        case "Isha": return "العشاء"
        default: return prayer
        }
    }
}*/
/*import SwiftUI
import Adhan
import Foundation

struct PrayerTimesView: View {
    @ObservedObject var prayerManager = PrayerTimesManager()
    @State private var useCurrentLocation = true
    @State private var selectedCity: City? = nil
    @State private var is24HourFormat = true
    @State private var showCityPicker = false

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                // ✅ زر الرجوع
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.backward")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.blue)
                            .padding(8)
                    }
                    Spacer()
                }
                .padding(.horizontal)

                // ✅ العنوان
                Text("🕌 مواقيت الصلاة")
                    .font(.largeTitle.bold())
                    .padding(.top, 5)

                // ✅ التاريخ الهجري والميلادي
                VStack(spacing: 4) {
                    Text(prayerManager.hijriDate)
                        .font(.title3)
                        .foregroundColor(.primary)

                    Text(prayerManager.gregorianDate)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                // ✅ التبديل بين الموقع أو المدينة
                Toggle("استخدام الموقع الحالي", isOn: $useCurrentLocation)
                    .padding(.horizontal)

                if !useCurrentLocation {
                    Button(action: {
                        showCityPicker.toggle()
                    }) {
                        Text(selectedCity?.name ?? "اختر مدينة")
                            .font(.headline)
                            .foregroundColor(.blue)
                            .padding(.vertical, 6)
                    }
                }

                // ✅ زر التحديث
                Button(action: {
                    if useCurrentLocation {
                        if let loc = LocationManager.shared.currentLocation {
                            prayerManager.fetchPrayerTimes(latitude: loc.coordinate.latitude, longitude: loc.coordinate.longitude)
                        }
                    } else if let city = selectedCity {
                        prayerManager.fetchPrayerTimes(latitude: city.latitude, longitude: city.longitude)
                    }
                }) {
                    HStack {
                        Image(systemName: "arrow.clockwise")
                        Text("تحديث المواقيت")
                            .font(.headline)
                    }
                    .foregroundColor(.blue)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                }

                // ✅ تنسيق الوقت
                VStack {
                    Text("تنسيق الوقت:")
                        .font(.headline)

                    Picker("", selection: $is24HourFormat) {
                        Text("12h").tag(false)
                        Text("24h").tag(true)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 150)
                }

                // ✅ جدول الصلوات
                VStack(spacing: 12) {
                    ForEach(prayerManager.sortedPrayerTimes(is24HourFormat: is24HourFormat), id: \.key) { name, time in
                        HStack {
                            Image(systemName: iconName(for: name))
                                .foregroundColor(.blue)
                            Text(prayerName(for: name))
                                .font(.headline)
                            Spacer()
                            Text(time)
                                .font(.headline)
                        }
                        .padding(.horizontal)
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.systemGray6))
                        .shadow(radius: 3)
                )
                .padding(.horizontal)

                // ✅ عداد الصلاة القادمة
                if let nextPrayer = prayerManager.nextPrayer {
                    VStack(spacing: 8) {
                        Text("🕰️ باقي على الصلاة القادمة")
                            .font(.headline)
                            .foregroundColor(.gray)

                        Text("\(prayerName(for: nextPrayer.name)) بعد \(prayerManager.timeRemaining)")
                            .font(.title2.bold())
                            .foregroundColor(.blue)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(.systemGray6))
                            .shadow(radius: 3)
                    )
                    .padding(.horizontal)
                }

                Spacer(minLength: 40)
            }
            .padding(.vertical)
        }
        .sheet(isPresented: $showCityPicker) {
            CityPickerView(selectedCity: $selectedCity, prayerManager: prayerManager)
        }
        .onAppear {
            if useCurrentLocation {
                if let loc = LocationManager.shared.currentLocation {
                    prayerManager.fetchPrayerTimes(latitude: loc.coordinate.latitude, longitude: loc.coordinate.longitude)
                } else {
                    LocationManager.shared.requestLocation()
                }
            } else if let city = selectedCity {
                prayerManager.fetchPrayerTimes(latitude: city.latitude, longitude: city.longitude)
            }
        }
        .onReceive(LocationManager.shared.$currentLocation.compactMap { $0 }) { loc in
            if useCurrentLocation {
                prayerManager.fetchPrayerTimes(latitude: loc.coordinate.latitude, longitude: loc.coordinate.longitude)
            }
        }
        .navigationBarBackButtonHidden(true)
    }

    private func iconName(for prayer: String) -> String {
        switch prayer {
        case "Fajr": return "moon.stars.fill"
        case "Sunrise": return "sunrise.fill"
        case "Dhuhr": return "sun.max.fill"
        case "Asr": return "sun.dust.fill"
        case "Maghrib": return "sunset.fill"
        case "Isha": return "moon.fill"
        default: return "clock.fill"
        }
    }

    private func prayerName(for prayer: String) -> String {
        switch prayer {
        case "Fajr": return "الفجر"
        case "Sunrise": return "الشروق"
        case "Dhuhr": return "الظهر"
        case "Asr": return "العصر"
        case "Maghrib": return "المغرب"
        case "Isha": return "العشاء"
        default: return prayer
        }
    }
}*/

/*import SwiftUI
import Adhan
import Foundation

struct PrayerTimesView: View {
    @ObservedObject var prayerManager = PrayerTimesManager()
    @State private var useCurrentLocation = true
    @State private var selectedCity: City? = nil
    @State private var is24HourFormat = true
    @State private var showCityPicker = false

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                // ✅ زر الرجوع أيقوني
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.backward")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.blue)
                            .padding(8)
                    }
                    Spacer()
                }
                .padding(.horizontal)

                // ✅ العنوان والتاريخ
                VStack(spacing: 6) {
                    Text("🕌 مواقيت الصلاة")
                        .font(.largeTitle.bold())
                        .frame(maxWidth: .infinity, alignment: .center)

                    Text(prayerManager.hijriDate)
                        .font(.title3)
                        .foregroundColor(.primary)

                    Text(prayerManager.gregorianDate)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                // ✅ اختيار الموقع أو المدينة
                VStack(alignment: .leading, spacing: 12) {
                    Toggle("استخدام الموقع الحالي", isOn: $useCurrentLocation)
                        .onChange(of: useCurrentLocation) { isUsingLocation in
                            if isUsingLocation {
                                selectedCity = nil
                                if let loc = LocationManager.shared.currentLocation {
                                    prayerManager.fetchPrayerTimes(latitude: loc.coordinate.latitude, longitude: loc.coordinate.longitude)
                                }
                            }
                        }

                    if !useCurrentLocation {
                        Button(action: {
                            showCityPicker.toggle()
                        }) {
                            Text(selectedCity?.name ?? "اختر مدينة")
                                .font(.headline)
                                .foregroundColor(.blue)
                        }
                    }

                    Button(action: {
                        if useCurrentLocation {
                            if let loc = LocationManager.shared.currentLocation {
                                prayerManager.fetchPrayerTimes(latitude: loc.coordinate.latitude, longitude: loc.coordinate.longitude)
                            }
                        } else if let city = selectedCity {
                            prayerManager.fetchPrayerTimes(latitude: city.latitude, longitude: city.longitude)
                        }
                    }) {
                        HStack {
                            Image(systemName: "arrow.clockwise")
                            Text("تحديث المواقيت")
                                .font(.headline)
                        }
                        .foregroundColor(.blue)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                    }
                }
                .padding(.horizontal)

                // ✅ تنسيق الوقت
                VStack(spacing: 6) {
                    Text("تنسيق الوقت:")
                        .font(.headline)

                    Picker("", selection: $is24HourFormat) {
                        Text("12h").tag(false)
                        Text("24h").tag(true)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 150)
                }
                .frame(maxWidth: .infinity, alignment: .center)

                // ✅ بطاقة مواقيت الصلاة
                VStack(spacing: 14) {
                    ForEach(prayerManager.sortedPrayerTimes(is24HourFormat: is24HourFormat), id: \.key) { name, time in
                        HStack {
                            Image(systemName: iconName(for: name))
                                .foregroundColor(.blue)
                            Text(prayerName(for: name))
                                .font(.headline)
                            Spacer()
                            Text(time)
                                .font(.headline)
                        }
                        .padding(.horizontal)
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.systemGray6))
                        .shadow(radius: 3)
                )
                .padding(.horizontal)

                // ✅ عداد الصلاة القادمة
                if let nextPrayer = prayerManager.nextPrayer {
                    VStack(spacing: 8) {
                        Text("🕰️ باقي على الصلاة القادمة")
                            .font(.headline)
                            .foregroundColor(.gray)

                        Text("\(prayerName(for: nextPrayer.name)) بعد \(prayerManager.timeRemaining)")
                            .font(.title2.bold())
                            .foregroundColor(.blue)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(.systemGray6))
                            .shadow(radius: 3)
                    )
                    .padding(.horizontal)
                }

                Spacer(minLength: 50)
            }
            .padding(.vertical)
        }
        .sheet(isPresented: $showCityPicker) {
            CityPickerView(selectedCity: $selectedCity, prayerManager: prayerManager)
        }
        .onAppear {
            if useCurrentLocation {
                if let loc = LocationManager.shared.currentLocation {
                    prayerManager.fetchPrayerTimes(latitude: loc.coordinate.latitude, longitude: loc.coordinate.longitude)
                } else {
                    LocationManager.shared.requestLocation()
                }
            } else if let city = selectedCity {
                prayerManager.fetchPrayerTimes(latitude: city.latitude, longitude: city.longitude)
            }
        }
        .onReceive(LocationManager.shared.$currentLocation.compactMap { $0 }) { loc in
            if useCurrentLocation {
                prayerManager.fetchPrayerTimes(latitude: loc.coordinate.latitude, longitude: loc.coordinate.longitude)
            }
        }
        .navigationBarBackButtonHidden(true)
    }

    // ✅ أيقونات الصلوات
    private func iconName(for prayer: String) -> String {
        switch prayer {
        case "Fajr": return "moon.stars.fill"
        case "Sunrise": return "sunrise.fill"
        case "Dhuhr": return "sun.max.fill"
        case "Asr": return "sun.dust.fill"
        case "Maghrib": return "sunset.fill"
        case "Isha": return "moon.fill"
        default: return "clock.fill"
        }
    }

    // ✅ أسماء الصلوات بالعربية
    private func prayerName(for prayer: String) -> String {
        switch prayer {
        case "Fajr": return "الفجر"
        case "Sunrise": return "الشروق"
        case "Dhuhr": return "الظهر"
        case "Asr": return "العصر"
        case "Maghrib": return "المغرب"
        case "Isha": return "العشاء"
        default: return prayer
        }
    }
}*/
/*import SwiftUI
import Adhan
import Foundation

struct PrayerTimesView: View {
    @ObservedObject var prayerManager = PrayerTimesManager()
    @State private var useCurrentLocation = true
    @State private var selectedCity: City? = nil
    @State private var is24HourFormat = true
    @State private var showCityPicker = false

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 8) {

                // ✅ زر الرجوع
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.backward")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.blue)
                            .padding(6)
                    }
                    Spacer()
                }
                .padding(.horizontal, 16)

                // ✅ العنوان والتاريخ
                VStack(spacing: 4) {
                    Text(" مواقيت الصلاة")
                        .font(.title2.bold())

                    Text(prayerManager.hijriDate)
                        .font(.callout)
                        .foregroundColor(.primary)

                    Text(prayerManager.gregorianDate)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }

                // ✅ الموقع / المدينة
                VStack(spacing: 6) {
                    Toggle("استخدام الموقع الحالي", isOn: $useCurrentLocation)
                        .padding(.horizontal)

                    if !useCurrentLocation {
                        Button(action: {
                            showCityPicker.toggle()
                        }) {
                            Text(selectedCity?.name ?? "اختر مدينة")
                                .font(.subheadline)
                                .foregroundColor(.blue)
                        }
                    }

                    Button(action: {
                        if useCurrentLocation {
                            if let loc = LocationManager.shared.currentLocation {
                                prayerManager.fetchPrayerTimes(latitude: loc.coordinate.latitude, longitude: loc.coordinate.longitude)
                            }
                        } else if let city = selectedCity {
                            prayerManager.fetchPrayerTimes(latitude: city.latitude, longitude: city.longitude)
                        }
                    }) {
                        HStack {
                            Image(systemName: "arrow.clockwise")
                            Text("تحديث المواقيت")
                                .font(.subheadline)
                        }
                        .foregroundColor(.blue)
                        .padding(8)
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    }
                    .padding(.horizontal)
                }

                // ✅ تنسيق الوقت
                VStack(spacing: 4) {
                    Text("تنسيق الوقت:")
                        .font(.subheadline)

                    Picker("", selection: $is24HourFormat) {
                        Text("12h").tag(false)
                        Text("24h").tag(true)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 140)
                }

                // ✅ الصلوات
                VStack(spacing: 10) {
                    ForEach(prayerManager.sortedPrayerTimes(is24HourFormat: is24HourFormat), id: \.key) { name, time in
                        HStack {
                            Image(systemName: iconName(for: name))
                                .foregroundColor(.blue)
                            Text(prayerName(for: name))
                                .font(.subheadline)
                            Spacer()
                            Text(time)
                                .font(.subheadline)
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.vertical, 8)
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color(.systemGray6)).shadow(radius: 1))
                .padding(.horizontal)

                // ✅ الصلاة القادمة
                if let nextPrayer = prayerManager.nextPrayer {
                    VStack(spacing: 4) {
                        Text(" باقي على الصلاة القادمة")
                            .font(.footnote)
                            .foregroundColor(.gray)

                        Text("\(prayerName(for: nextPrayer.name)) بعد \(prayerManager.timeRemaining)")
                            .font(.headline)
                            .foregroundColor(.blue)
                    }
                    .padding(8)
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color(.systemGray6)).shadow(radius: 1))
                    .padding(.horizontal)
                }

                Spacer()
            }
            .frame(height: geo.size.height - 20)
        }
        .sheet(isPresented: $showCityPicker) {
            CityPickerView(selectedCity: $selectedCity, prayerManager: prayerManager)
        }
        .onAppear {
            if useCurrentLocation {
                if let loc = LocationManager.shared.currentLocation {
                    prayerManager.fetchPrayerTimes(latitude: loc.coordinate.latitude, longitude: loc.coordinate.longitude)
                } else {
                    LocationManager.shared.requestLocation()
                }
            } else if let city = selectedCity {
                prayerManager.fetchPrayerTimes(latitude: city.latitude, longitude: city.longitude)
            }
        }
        .onReceive(LocationManager.shared.$currentLocation.compactMap { $0 }) { loc in
            if useCurrentLocation {
                prayerManager.fetchPrayerTimes(latitude: loc.coordinate.latitude, longitude: loc.coordinate.longitude)
            }
        }
        .navigationBarBackButtonHidden(true)
    }

    private func iconName(for prayer: String) -> String {
        switch prayer {
        case "Fajr": return "moon.stars.fill"
        case "Sunrise": return "sunrise.fill"
        case "Dhuhr": return "sun.max.fill"
        case "Asr": return "sun.dust.fill"
        case "Maghrib": return "sunset.fill"
        case "Isha": return "moon.fill"
        default: return "clock.fill"
        }
    }

    private func prayerName(for prayer: String) -> String {
        switch prayer {
        case "Fajr": return "الفجر"
        case "Sunrise": return "الشروق"
        case "Dhuhr": return "الظهر"
        case "Asr": return "العصر"
        case "Maghrib": return "المغرب"
        case "Isha": return "العشاء"
        default: return prayer
        }
    }
}*/
import SwiftUI
import Adhan
import Foundation

struct PrayerTimesView: View {
    @ObservedObject var prayerManager = PrayerTimesManager()
    @State private var useCurrentLocation = true
    @State private var selectedCity: City? = nil
    @State private var is24HourFormat = true
    @State private var showCityPicker = false

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 12) {

            // ✅ زر الرجوع
            HStack {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.backward")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.blue)
                        .padding(6)
                }
                Spacer()
            }
            .padding(.horizontal, 16)

            // ✅ العنوان والتاريخ
            VStack(spacing: 4) {
                Text("🕌 مواقيت الصلاة")
                    .font(.title2.bold())

                Text(prayerManager.hijriDate)
                    .font(.callout)
                    .foregroundColor(.primary)

                Text(prayerManager.gregorianDate)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            // ✅ الموقع / المدينة
            VStack(spacing: 6) {
                Toggle("استخدام الموقع الحالي", isOn: $useCurrentLocation)
                    .padding(.horizontal)

                if !useCurrentLocation {
                    Button(action: {
                        showCityPicker.toggle()
                    }) {
                        Text(selectedCity?.name ?? "اختر مدينة")
                            .font(.subheadline)
                            .foregroundColor(.blue)
                    }
                }

                Button(action: {
                    if useCurrentLocation {
                        if let loc = LocationManager.shared.currentLocation {
                            prayerManager.fetchPrayerTimes(latitude: loc.coordinate.latitude, longitude: loc.coordinate.longitude)
                        }
                    } else if let city = selectedCity {
                        prayerManager.fetchPrayerTimes(latitude: city.latitude, longitude: city.longitude)
                    }
                }) {
                    HStack {
                        Image(systemName: "arrow.clockwise")
                        Text("تحديث المواقيت")
                            .font(.subheadline)
                    }
                    .foregroundColor(.blue)
                    .padding(8)
                    .frame(maxWidth: .infinity)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                }
                .padding(.horizontal)
            }

            // ✅ تنسيق الوقت
            VStack(spacing: 4) {
                Text("تنسيق الوقت:")
                    .font(.subheadline)

                Picker("", selection: $is24HourFormat) {
                    Text("12h").tag(false)
                    Text("24h").tag(true)
                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: 140)
            }

            // ✅ الصلوات
            VStack(spacing: 10) {
                ForEach(prayerManager.sortedPrayerTimes(is24HourFormat: is24HourFormat), id: \.key) { name, time in
                    HStack {
                        Image(systemName: iconName(for: name))
                            .foregroundColor(.blue)
                        Text(prayerName(for: name))
                            .font(.subheadline)
                        Spacer()
                        Text(convertToWesternNumbers(time))
                            .font(.subheadline)
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color(.systemGray6)).shadow(radius: 1))
            .padding(.horizontal)

            // ✅ الصلاة القادمة
            if let nextPrayer = prayerManager.nextPrayer {
                VStack(spacing: 4) {
                    Text("🕰️ باقي على الصلاة القادمة")
                        .font(.footnote)
                        .foregroundColor(.gray)

                    Text("\(prayerName(for: nextPrayer.name)) بعد \(convertToWesternNumbers(prayerManager.timeRemaining))")
                        .font(.headline)
                        .foregroundColor(.blue)
                }
                .padding(8)
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color(.systemGray6)).shadow(radius: 1))
                .padding(.horizontal)
            }

            Spacer(minLength: 10)
        }
        .padding(.vertical)
        .sheet(isPresented: $showCityPicker) {
            CityPickerView(selectedCity: $selectedCity, prayerManager: prayerManager)
        }
        .onAppear {
            if useCurrentLocation {
                if let loc = LocationManager.shared.currentLocation {
                    prayerManager.fetchPrayerTimes(latitude: loc.coordinate.latitude, longitude: loc.coordinate.longitude)
                } else {
                    LocationManager.shared.requestLocation()
                }
            } else if let city = selectedCity {
                prayerManager.fetchPrayerTimes(latitude: city.latitude, longitude: city.longitude)
            }
        }
        .onReceive(LocationManager.shared.$currentLocation.compactMap { $0 }) { loc in
            if useCurrentLocation {
                prayerManager.fetchPrayerTimes(latitude: loc.coordinate.latitude, longitude: loc.coordinate.longitude)
            }
        }
        .navigationBarBackButtonHidden(true)
    }

    // ✅ أيقونات الصلوات
    private func iconName(for prayer: String) -> String {
        switch prayer {
        case "Fajr": return "moon.stars.fill"
        case "Sunrise": return "sunrise.fill"
        case "Dhuhr": return "sun.max.fill"
        case "Asr": return "sun.dust.fill"
        case "Maghrib": return "sunset.fill"
        case "Isha": return "moon.fill"
        default: return "clock.fill"
        }
    }

    // ✅ أسماء الصلوات بالعربي
    private func prayerName(for prayer: String) -> String {
        switch prayer {
        case "Fajr": return "الفجر"
        case "Sunrise": return "الشروق"
        case "Dhuhr": return "الظهر"
        case "Asr": return "العصر"
        case "Maghrib": return "المغرب"
        case "Isha": return "العشاء"
        default: return prayer
        }
    }

    // ✅ تحويل الأرقام الهندية إلى عربية غربية
    private func convertToWesternNumbers(_ input: String) -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en")
        return input.map { char -> String in
            if let digit = Int(String(char)) {
                return formatter.string(from: NSNumber(value: digit)) ?? "\(digit)"
            } else {
                return String(char)
            }
        }.joined()
    }
}
