//
//  city.swift
//  Tasbeeh+ | تسبيح
//
//  Created by A Sky on 16/09/1446 AH.
//

import SwiftUI
import Foundation
import Adhan


struct City: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double
}
// قائمة بجميع مدن المملكة العربية السعودية
/*let saudiCities: [City] = [
    City(name: "الرياض", latitude: 24.7136, longitude: 46.6753),
    City(name: "مكة المكرمة", latitude: 21.3891, longitude: 39.8579),
    City(name: "المدينة المنورة", latitude: 24.5247, longitude: 39.5692),
    City(name: "جدة", latitude: 21.2854, longitude: 39.2376),
    City(name: "الدمام", latitude: 26.3927, longitude: 49.9777),
    City(name: "الخبر", latitude: 26.3094, longitude: 50.1381),
    City(name: "الطائف", latitude: 21.4373, longitude: 40.5127),
    City(name: "بريدة", latitude: 26.3251, longitude: 43.9750),
    City(name: "أبها", latitude: 18.2233, longitude: 42.5074),
    City(name: "حائل", latitude: 27.5219, longitude: 41.6907),
    City(name: "جازان", latitude: 16.8891, longitude: 42.5706),
    City(name: "نجران", latitude: 17.5651, longitude: 44.2289),
    City(name: "سكاكا", latitude: 29.9697, longitude: 40.2064),
    City(name: "تبوك", latitude: 28.3830, longitude: 36.5836),
    City(name: "الباحة", latitude: 20.0120, longitude: 41.4677)
]
*/
let saudiCities: [City] = [
    City(name: "الرياض", latitude: 24.7136, longitude: 46.6753),
    City(name: "مكة المكرمة", latitude: 21.3891, longitude: 39.8579),
    City(name: "المدينة المنورة", latitude: 24.5247, longitude: 39.5692),
    City(name: "الخرج", latitude: 24.1556, longitude: 47.3121),
    City(name: "جدة", latitude: 21.2854, longitude: 39.2376),
    City(name: "الدمام", latitude: 26.3927, longitude: 49.9777),
    City(name: "الخبر", latitude: 26.3094, longitude: 50.1381),
    City(name: "الطائف", latitude: 21.4373, longitude: 40.5127),
    City(name: "بريدة", latitude: 26.3251, longitude: 43.9750),
    City(name: "أبها", latitude: 18.2233, longitude: 42.5074),
    City(name: "حائل", latitude: 27.5219, longitude: 41.6907),
    City(name: "جازان", latitude: 16.8891, longitude: 42.5706),
    City(name: "نجران", latitude: 17.5651, longitude: 44.2289),
    City(name: "سكاكا", latitude: 29.9697, longitude: 40.2064),
    City(name: "تبوك", latitude: 28.3830, longitude: 36.5836),
    City(name: "الباحة", latitude: 20.0120, longitude: 41.4677),
    City(name: "ينبع", latitude: 24.0946, longitude: 38.0498),
    City(name: "رابغ", latitude: 22.7986, longitude: 39.0349),
    City(name: "الليث", latitude: 20.1361, longitude: 40.2706),
    City(name: "القنفذة", latitude: 19.1243, longitude: 41.0786),
    City(name: "بيشة", latitude: 19.9873, longitude: 42.5891),
    City(name: "المجمعة", latitude: 25.9110, longitude: 45.3489),
    City(name: "الزلفي", latitude: 26.3032, longitude: 44.8152),
    City(name: "الدوادمي", latitude: 24.5075, longitude: 44.3922),
    City(name: "عنيزة", latitude: 26.0889, longitude: 43.9883),
    City(name: "الرس", latitude: 25.8694, longitude: 43.4973),
    City(name: "الوجه", latitude: 26.2444, longitude: 36.4520),
    City(name: "ضباء", latitude: 27.3484, longitude: 35.6855),
    City(name: "العلا", latitude: 26.6333, longitude: 37.5167),
    City(name: "الطريف", latitude: 31.4646, longitude: 38.6631),
    City(name: "رفحاء", latitude: 29.6202, longitude: 43.4932),
    City(name: "عرعر", latitude: 30.9813, longitude: 41.0415),
    City(name: "شرورة", latitude: 17.4745, longitude: 47.1214),
    City(name: "محايل عسير", latitude: 18.5528, longitude: 41.9301),
    City(name: "القرى", latitude: 20.3250, longitude: 41.6058)
]

