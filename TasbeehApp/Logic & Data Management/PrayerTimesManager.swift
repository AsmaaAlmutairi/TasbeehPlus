//
//  PrayerTimesManager.swift
//  Tasbeeh+ | تسبيح
//
//  Created by A Sky on 13/09/1446 AH.
//
/*import SwiftUI
import Foundation
import CoreLocation
//مسؤول عن جلب مواقيت الصلاة من API.
class PrayerTimesManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var prayerTimes: [String: String] = [:]
    @Published var locationStatus: CLAuthorizationStatus?
    
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
    }

    func requestLocation() {
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        default:
            print("Location access denied")
        }
    }
    
    func fetchPrayerTimes(city: String) {
        let cityEncoded = city.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? city
        let urlString = "https://api.aladhan.com/v1/timingsByCity?city=\(cityEncoded)&country=SA&method=4"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                print("API Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let result = try decoder.decode(PrayerTimesResponse.self, from: data)
                
                DispatchQueue.main.async {
                    // تحديث القاموس مباشرة من timings
                    self?.prayerTimes = result.data.timings
                    print("تم استلام البيانات بنجاح:", result.data.timings)
                }
            } catch let decodingError {
                print("Decoding Error: \(decodingError.localizedDescription)")
            }
        }.resume()
    }
    
    // MARK: - CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        fetchPrayerTimes(latitude: location.coordinate.latitude,
                        longitude: location.coordinate.longitude)
        locationManager.stopUpdatingLocation()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        locationStatus = manager.authorizationStatus
    }
    
    private func fetchPrayerTimes(latitude: Double, longitude: Double) {
        let urlString = "https://api.aladhan.com/v1/timings?latitude=\(latitude)&longitude=\(longitude)&method=4"
        
        guard let url = URL(string: urlString) else {
            print("Invalid Location URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let result = try JSONDecoder().decode(PrayerTimesResponse.self, from: data)
                DispatchQueue.main.async {
                    // تحديث القاموس مباشرة من timings
                    self?.prayerTimes = result.data.timings
                }
            } catch {
                print("Location Prayer Times Error: \(error)")
            }
        }.resume()
    }
}

// MARK: - نماذج البيانات المصححة
struct PrayerTimesResponse: Codable {
    let code: Int
    let status: String
    let data: PrayerData
}

struct PrayerData: Codable {
    let timings: [String: String] // يحتوي على Sunrise هنا
    let date: PrayerDate
    
    // احذف هذه الحقول غير الموجودة في الرد
    // let sunrise: String
    // let sunset: String
}

struct PrayerDate: Codable {
    let hijri: HijriDate
}

struct HijriDate: Codable {
    let date: String
    let format: String?
    let day: String?
}*/

import Foundation
import CoreLocation
import Adhan
import SwiftUI
import WidgetKit

@MainActor

class PrayerTimesManager: ObservableObject {
    @Published var prayerTimes: [String: String] = [:]
    @Published var timeRemaining: String = ""
    @Published var nextPrayer: (name: String, time: String)?
    
    // ✅ تحديث القيم بشكل فوري لإجبار SwiftUI على إعادة التحديث
    @Published var hijriDate: String = "..." {
        willSet { objectWillChange.send() }
    }
    @Published var gregorianDate: String = "..." {
        willSet { objectWillChange.send() }
    }
    func savePrayerTimesToUserDefaults(_ times: [String]) {
        UserDefaults.standard.setValue(times, forKey: "prayerTimes")
        WidgetCenter.shared.reloadAllTimelines() // تحديث الويدجت فورًا
    }


    func fetchPrayerTimes(latitude: Double, longitude: Double) {
        fetchPrayerTimesFromAPI(latitude: latitude, longitude: longitude)
    }

    private func fetchPrayerTimesFromAPI(latitude: Double, longitude: Double) {
        //let urlString =
        
        /*"https://api.aladhan.com/v1/timings?latitude=\(latitude)&longitude=\(longitude)&method=2&iso8601=true"*/
    
        
        let urlString = "https://api.aladhan.com/v1/timings?latitude=\(latitude)&longitude=\(longitude)&method=4&iso8601=true"

        
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("❌ خطأ في جلب بيانات الأذان: \(error.localizedDescription)")
                return
            }
            guard let jsonData = data else { return }
            do {
                let response = try JSONDecoder().decode(PrayerTimesResponse.self, from: jsonData)
                DispatchQueue.main.async {
                    self.prayerTimes = response.data.timings
                    self.hijriDate = response.data.date.hijri.date
                    self.gregorianDate = response.data.date.gregorian.date
                    self.updateNextPrayerTime()
                    print("🌍 من API: \(response.data.timings)")
                    print("📡 استجابة API: \(String(data: jsonData, encoding: .utf8) ?? "❌ فشل في قراءة البيانات")")

                    // ✅ طباعة القيم للتأكد من أنها ليست فارغة
                    print("📅 التاريخ الهجري: \(self.hijriDate)")
                    print("📆 التاريخ الميلادي: \(self.gregorianDate)")
                }
            } catch {
                print("❌ فشل في تحليل JSON")
            }
        }.resume()
    }

   
    func updateNextPrayerTime() {
        let now = Date()
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [.withInternetDateTime] // ✅ تحليل توقيت API
        
        let orderedPrayers = ["Fajr", "Dhuhr", "Asr", "Maghrib", "Isha"]
        var nextPrayerName: String?
        var nextPrayerTime: Date?

        for prayer in orderedPrayers {
            if let timeString = prayerTimes[prayer], let prayerTime = isoFormatter.date(from: timeString) {
                if prayerTime > now {
                    nextPrayerName = prayerName(for: prayer)
                    nextPrayerTime = prayerTime
                    break
                }
            }
        }

        if let nextTime = nextPrayerTime, let name = nextPrayerName {
            let timeInterval = nextTime.timeIntervalSince(now)
            let hours = Int(timeInterval) / 3600
            let minutes = (Int(timeInterval) % 3600) / 60

            DispatchQueue.main.async {
                let formatter = DateFormatter()
                formatter.dateFormat = "h:mm a"
                formatter.timeZone = TimeZone.current

                self.nextPrayer = (name, formatter.string(from: nextTime))
                self.timeRemaining = "\(hours) ساعة و \(minutes) دقيقة"
            }
        }
    }

    private func calculateLocalPrayerTimes(latitude: Double, longitude: Double) -> [String: String]? {
        let coordinates = Coordinates(latitude: latitude, longitude: longitude)
        var params = CalculationMethod.ummAlQura.params
        params.madhab = .shafi
        params.adjustments.fajr = 2 // قم بتعديل القيم هنا إذا كان هناك انحراف بسيط
        params.adjustments.isha = 2
        
        let calendar = Calendar(identifier: .gregorian)
        let dateComponents = calendar.dateComponents([.year, .month, .day], from: Date())

        guard let prayerTimes = PrayerTimes(coordinates: coordinates, date: dateComponents, calculationParameters: params) else {
            print("❌ فشل حساب أوقات الصلاة محليًا")
            return nil
        }

        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "HH:mm"

        let calculatedTimes: [String: String] = [
            "Fajr": formatter.string(from: prayerTimes.fajr),
            "Sunrise": formatter.string(from: prayerTimes.sunrise),
            "Dhuhr": formatter.string(from: prayerTimes.dhuhr),
            "Asr": formatter.string(from: prayerTimes.asr),
            "Maghrib": formatter.string(from: prayerTimes.maghrib),
            "Isha": formatter.string(from: prayerTimes.isha)
        ]

        print("⏳ حساب محلي: \(calculatedTimes)") // ✅ عرض القيم المحسوبة محليًا
        return calculatedTimes
    }



    func sortedPrayerTimes(is24HourFormat: Bool) -> [(key: String, value: String)] {
        let allowedPrayers = ["Fajr", "Sunrise", "Dhuhr", "Asr", "Maghrib", "Isha"] // ✅ الصلوات الأساسية فقط
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [.withInternetDateTime] // ✅ التعامل مع توقيت API
        
        let outputFormatter = DateFormatter()
        outputFormatter.timeZone = TimeZone.current
        outputFormatter.dateFormat = is24HourFormat ? "HH:mm" : "h:mm a"

        let sortedTimes = prayerTimes.compactMap { (key, value) -> (String, String, Date)? in
            if allowedPrayers.contains(key), let date = isoFormatter.date(from: value) {
                return (key, outputFormatter.string(from: date), date)
            }
            return nil
        }.sorted { $0.2 < $1.2 }

        return sortedTimes.map { ($0.0, $0.1) }
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

}
