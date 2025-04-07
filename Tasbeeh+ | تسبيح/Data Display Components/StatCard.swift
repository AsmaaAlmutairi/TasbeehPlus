//
//  StatCard.swift
//  Tasbeeh+ | تسبيح
//
//  Created by A Sky on 13/09/1446 AH.
//
import Foundation
import SwiftUI
import Charts
//عنصر فردي لعرض عدد مرات الذكر
/// ✅ **تصميم بطاقة لكل ذكر**
struct StatCard: View {
    var title: String
    var count: Int
    var color: Color

    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
                .bold()
                .foregroundColor(.white)
            Text("\(count)")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
        }
        .padding()
        .frame(width: 110, height: 120)
        .background(color)
        .cornerRadius(15)
        .shadow(radius: 5)
        .transition(.scale)
    }
}
