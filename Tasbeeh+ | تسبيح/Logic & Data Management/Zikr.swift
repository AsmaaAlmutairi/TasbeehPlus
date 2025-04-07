//
//  Zikr.swift
//  Tasbeeh+ | تسبيح
//
//  Created by A Sky on 14/09/1446 AH.
//
import SwiftUI
import Foundation

struct Zikr: Identifiable {
    let id = UUID()
    let text: String
    let repetition: Int // ✅ عدد التكرارات
    let virtue: String? // ✅ جعلها اختيارية
}
