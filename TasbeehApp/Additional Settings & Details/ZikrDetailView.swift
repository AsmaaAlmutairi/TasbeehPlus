//
//  ZikrDetailView.swift
//  Tasbeeh+ | تسبيح
//
//  Created by A Sky on 13/09/1446 AH.
//

import Foundation
import SwiftUI

struct ZikrDetailView: View {
    
    var zikr: Zikr
    @Binding var selectedTheme: Int
    @Binding var isWarmLightOn: Bool
    @State private var count: Int = 0

    var body: some View {
        ZStack {
            AppColor.background(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn)
                .ignoresSafeArea()
            
            VStack(spacing: 15) {
                HStack {
                    Button(action: {
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }) {
                        Image(systemName: "chevron.backward")
                            .font(.title2)
                            .foregroundColor(AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                    }
                    
                    Spacer()
                    
                    Text("أذكار \(zikr.text)")
                        .font(.title2)
                        .bold()
                        .foregroundColor(AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                    
                    Spacer()
                    
                    Image(systemName: "sun.max.fill")
                        .font(.title2)
                        .foregroundColor(AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                }
                .padding()
                
                ProgressView(value: Double(count) / Double(zikr.repetition))
                    .progressViewStyle(LinearProgressViewStyle(tint: AppColor.accent(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn)))
                    .padding(.horizontal)
                
                Text(zikr.text)
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .padding()
                
                VStack {
                    Text("\(count)")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(AppColor.accent(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                    
                    HStack {
                        Button(action: { count = 0 }) {
                            Image(systemName: "arrow.counterclockwise")
                                .font(.title2)
                                .foregroundColor(.white)
                                .frame(width: 60, height: 60)
                                .background(Circle().fill(AppColor.accent(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn)))
                        }
                        
                        Button(action: {
                            if count < zikr.repetition {
                                count += 1
                            }
                        }) {
                            Image(systemName: "plus")
                                .font(.title2)
                                .foregroundColor(.white)
                                .frame(width: 80, height: 80)
                                .background(Circle().fill(AppColor.accent(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn)))
                        }
                    }
                }
                .padding(.top)
                
                Spacer()
            }
        }
    }
}
