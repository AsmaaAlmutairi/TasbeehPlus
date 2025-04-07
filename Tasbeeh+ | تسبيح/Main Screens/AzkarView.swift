//
//  AzkarView.swift
//  Tasbeeh+ | تسبيح
//
//  Created by A Sky on 13/09/1446 AH.
//


//شاشة عرض الأذكار، تحتوي على Picker لاختيار نوع الأذكار.


/*
 import Foundation
 import SwiftUI
 
 struct AzkarView: View {
    @Binding var isWarmLightOn: Bool
    @Binding var selectedTheme: Int
    @State private var selectedCategory: AzkarCategory = .morning
    @State private var azkarList: [Zikr] = []
    @State private var currentZikrIndex: Int = 0
    @State private var showShareSheet = false
    @State private var textToShare = ""

    var body: some View {
        ZStack {
            // ✅ خلفية ديناميكية تتغير حسب الثيم
           /* LinearGradient(
                gradient: Gradient(colors: [
                    AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn).opacity(0.5),
                    AppColor.accent(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn).opacity(0.8)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )*/
            LinearGradient(
                gradient: Gradient(colors: isWarmLightOn ?
                    [
                        Color.black.opacity(0.9), // خلفية سوداء ناعمة عند تشغيل الوضع الليلي
                        Color.gray.opacity(0.6) // لون رمادي غامق ليضيف لمسة احترافية
                    ] :
                    [
                        AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn).opacity(0.5),
                        AppColor.accent(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn).opacity(0.8)
                    ]
                ),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )

            .ignoresSafeArea()

            VStack {
                // ✅ عنوان الصفحة (يتغير حسب الفئة المختارة)
                Text("📖 \(selectedCategory.rawValue)")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                    .padding()

                // ✅ اختيار نوع الأذكار
                Picker("اختر نوع الأذكار", selection: $selectedCategory) {
                    ForEach(AzkarCategory.allCases, id: \.self) { category in
                        Text(category.rawValue).tag(category)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                .onChange(of: selectedCategory) { _ in
                    updateAzkarList()
                }

                // ✅ عرض الذكر الحالي فقط، وتحديثه عند انتهاء التكرار
                if !azkarList.isEmpty {
                    ZikrCardView(
                        zikr: azkarList[currentZikrIndex],
                        selectedTheme: selectedTheme,
                        isWarmLightOn: isWarmLightOn,
                        onComplete: {
                            if currentZikrIndex < azkarList.count - 1 {
                                currentZikrIndex += 1
                            }
                        },
                        onShare: {
                            textToShare = azkarList[currentZikrIndex].text
                            showShareSheet.toggle()
                        }
                    )
                    .transition(.slide)
                    .animation(.easeInOut, value: currentZikrIndex)
                } else {
                    Text("✨ لا توجد أذكار متاحة لهذه الفئة")
                        .font(.title2)
                        .foregroundColor(AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                        .padding()
                }

                Spacer()
            }
        }
        .onAppear {
            updateAzkarList()
        }
        .sheet(isPresented: $showShareSheet) {
            ActivityView(activityItems: [textToShare])
        }
    }

    /// ✅ **تحديث قائمة الأذكار عند تغيير الفئة**
    private func updateAzkarList() {
        azkarList = Azkar.getAzkar(for: selectedCategory)
        currentZikrIndex = 0
    }
}*/

import SwiftUI

struct AzkarView: View {
    @Binding var isWarmLightOn: Bool
    @Binding var selectedTheme: Int
    
    @State private var azkarList: [Zikr] = []
    @State private var currentZikrIndex: Int = 0
    @State private var zikrRepetition: Int = 1
    @State private var completedRepetitions: Int = 0
    @State private var showShareSheet = false
    @State private var textToShare = ""
    @State private var selectedCategoryIndex: Int = 0 // ✅ مؤشر العنوان المحدد
    
    var body: some View {
        ZStack {
            backgroundGradient
                .ignoresSafeArea()
            
            VStack {
                categoryBar
                
                if !azkarList.isEmpty, currentZikrIndex >= 0, currentZikrIndex < azkarList.count {
                    zikrCard
                        .padding(.top, 15)
                        .transition(.asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .move(edge: .leading)
                        ))
                } else {
                    completionMessage
                        .transition(.opacity)
                }
                
                Spacer()
                
                zikrFooter
            }
        }
        .onAppear { loadInitialAzkar() }
        .sheet(isPresented: $showShareSheet) {
            ActivityView(activityItems: [textToShare])
        }
    }
    
    private var backgroundGradient: some View {
        LinearGradient(
            gradient: Gradient(
                colors: isWarmLightOn ?
                    [Color.black.opacity(0.95), Color.gray.opacity(0.7), Color.gray.opacity(0.4)] :
                    [AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn).opacity(0.6),
                     AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn).opacity(0.4),
                     AppColor.accent(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn).opacity(0.9)]
            ),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
    private var categoryBar: some View {
        VStack(spacing: 5) {
            ScrollViewReader { proxy in
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(AzkarCategory.allCases.indices, id: \.self) { index in
                                let category = AzkarCategory.allCases[index]
                                Button(action: {
                                    withAnimation(.easeInOut(duration: 0.3)) {
                                        selectedCategoryIndex = index
                                        updateAzkarList(for: category)
                                        proxy.scrollTo(index, anchor: .center) // ✅ تمرير `ScrollView` إلى العنوان المحدد
                                    }
                                }) {
                                    Text(category.rawValue)
                                        .font(.headline)
                                        .foregroundColor(selectedCategoryIndex == index ? .white : .black.opacity(0.8))
                                        .padding(.vertical, 8)
                                        .padding(.horizontal, 15)
                                        .background(
                                            RoundedRectangle(cornerRadius: 18)
                                                .fill(selectedCategoryIndex == index ? Color.orange.opacity(0.8) : Color.gray.opacity(0.2))
                                                .shadow(color: Color.orange.opacity(selectedCategoryIndex == index ? 0.5 : 0), radius: 5, x: 0, y: 2)
                                        )
                                }
                                .id(index) // ✅ إعطاء كل عنصر `id` للتمرير السلس
                            }
                        }
                        .padding(.horizontal, 20)
                    }

                    // ✅ خط التمرير مع المؤشر القابل للسحب
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .fill(Color.white.opacity(0.5)) // ✅ خط سير خفيف
                            .frame(height: 4)
                            .cornerRadius(2)

                        GeometryReader { geo in
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                                .frame(width: 40, height: 6)
                                .offset(x: categoryIndicatorOffset(geo.size.width))
                                .gesture(
                                    DragGesture()
                                        .onChanged { value in
                                            let width = geo.size.width
                                            let count = CGFloat(AzkarCategory.allCases.count)
                                            let step = width / count
                                            let newIndex = Int((value.location.x / step).rounded())

                                            if newIndex >= 0 && newIndex < AzkarCategory.allCases.count {
                                                selectedCategoryIndex = newIndex
                                                withAnimation(.easeInOut(duration: 0.3)) {
                                                    proxy.scrollTo(newIndex, anchor: .center) // ✅ تحريك `ScrollView`
                                                }
                                            }
                                        }
                                        .onEnded { _ in
                                            withAnimation(.easeInOut(duration: 0.3)) {
                                                updateAzkarList(for: AzkarCategory.allCases[selectedCategoryIndex])
                                            }
                                        }
                                )
                                .animation(.easeInOut(duration: 0.3), value: selectedCategoryIndex)
                        }
                    }
                    .frame(height: 6)
                    .padding(.horizontal, 20)
                }
            }
        }
        .frame(height: 55)
        .padding(.top, 5)
    }


    
    private func categoryIndicatorOffset(_ totalWidth: CGFloat) -> CGFloat {
        let count = CGFloat(AzkarCategory.allCases.count)
        let step = totalWidth / count
        return step * CGFloat(selectedCategoryIndex) + (step / 2) - 20 // تصحيح الإزاحة
    }
    
    private var zikrCard: some View {
        ZikrCardView(
            zikr: azkarList[currentZikrIndex],
            selectedTheme: selectedTheme,
            isWarmLightOn: isWarmLightOn,
            onComplete: handleCompletion,
            onShare: { prepareForSharing() }
        )
    }
    
    private var completionMessage: some View {
        VStack {
            Text("🎉 لقد أتممت قراءة الأذكار!")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                .padding()
            
            Text("أحسنت! يمكنك تكرارها أو العودة لاحقًا.")
                .font(.subheadline)
                .foregroundColor(AppColor.secondary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
    }
    
    private var zikrFooter: some View {
        ZikrFooterView(
            onCopy: { copyCurrentZikr() },
            onShare: { prepareForSharing() },
            completedRepetitions: $completedRepetitions,
            totalRepetitions: zikrRepetition,
            onComplete: handleCompletion,
            selectedTheme: selectedTheme,
            isWarmLightOn: isWarmLightOn
        )
    }
    
    private func loadInitialAzkar() {
        updateAzkarList(for: .morning)
    }
    
    private func updateAzkarList(for category: AzkarCategory) {
        azkarList = Azkar.getAzkar(for: category)
        currentZikrIndex = 0
        completedRepetitions = 0
        zikrRepetition = azkarList.isEmpty ? 1 : azkarList[currentZikrIndex].repetition
    }
    
    private func handleCompletion() {
        completedRepetitions = 0
        if currentZikrIndex < azkarList.count - 1 {
            currentZikrIndex += 1
            zikrRepetition = azkarList[currentZikrIndex].repetition
        } else {
            currentZikrIndex = -1
        }
    }
    
    private func copyCurrentZikr() {
        UIPasteboard.general.string = azkarList.isEmpty ? "" : azkarList[currentZikrIndex].text
    }
    
    private func prepareForSharing() {
        textToShare = azkarList.isEmpty ? "" : azkarList[currentZikrIndex].text
        showShareSheet.toggle()
    }
}
