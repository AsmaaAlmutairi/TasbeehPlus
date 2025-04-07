//
//  CounterView.swift
//  Tasbeeh+ | تسبيح
//
//  Created by A Sky on 13/09/1446 AH.
//

import Foundation
/*n
import Foundation
import SwiftUI

struct CounterView: View {
    @Binding var current: Int
    let total: Int
    let color: Color

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 3)
                .foregroundColor(color.opacity(0.3))

            Circle()
                .trim(from: 0, to: CGFloat(current) / CGFloat(total))
                .stroke(color, style: StrokeStyle(lineWidth: 4, lineCap: .round))
                .rotationEffect(.degrees(-90))

            Text("\(current)/\(total)")
                .font(.system(size: 12, weight: .bold, design: .monospaced))
                .foregroundColor(color)
        }
        .frame(width: 40, height: 40)
        .onTapGesture {
            withAnimation {
                if current < total {
                    current += 1
                }
            }
        }
    }
}*/
import Foundation
import SwiftUI
// عنصر لعرض عدد مرات الذكر مع إمكانية العد
struct CounterView: View {
    @Binding var current: Int
    let total: Int
    let color: Color
    var onComplete: () -> Void // ✅ التأكد من تنفيذ هذه الوظيفة عند اكتمال العداد
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 3)
                .foregroundColor(color.opacity(0.3))
            
            Circle()
                .trim(from: 0, to: CGFloat(current) / CGFloat(total))
                .stroke(color, style: StrokeStyle(lineWidth: 4, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut(duration: 0.3), value: current) // ✅ تحسين الانتقال
            
            Text("\(current)/\(total)")
                .font(.system(size: 12, weight: .bold, design: .monospaced))
                .foregroundColor(AppColor.primary(forTheme: 1, isWarmLightOn: true)) // ✅ استخدام لون ديناميكي
        }
        .frame(width: 50, height: 50) // ✅ جعل العداد أكبر قليلًا لرؤية أفضل
        .onTapGesture {
            if current < total {
                withAnimation {
                    current += 1
                }
                if current == total {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { // ✅ تأخير بسيط لضمان الانتقال السلس
                        onComplete()
                    }
                }
            }
        }
    }
}

