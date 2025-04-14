//
//  PrayerTimesResponse.swift
//  Tasbeeh+ | تسبيح
//
//  Created by A Sky on 16/09/1446 AH.
//

/*import Foundation
import SwiftUI

struct PrayerTimesResponse: Codable {
    let data: PrayerData
}

struct PrayerData: Codable {
    let timings: [String: String]
    let date: PrayerDate
}

struct PrayerDate: Codable {
    let hijri: HijriDate
    let gregorian: GregorianDate
}

struct HijriDate: Codable {
    let date: String
}

struct GregorianDate: Codable {
    let date: String
}*/
import Foundation
import SwiftUI
import Adhan


struct PrayerTimesResponse: Codable {
    let data: PrayerData
}

struct PrayerData: Codable {
    let timings: [String: String]
    let date: PrayerDate
}

struct PrayerDate: Codable {
    let hijri: HijriDate
    let gregorian: GregorianDate
}

struct HijriDate: Codable {
    let date: String
}

struct GregorianDate: Codable {
    let date: String
}
