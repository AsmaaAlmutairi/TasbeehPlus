//
//  SupportView.swift
//  Tasbeeh+ | تسبيح
//
//  Created by A Sky on 13/09/1446 AH.
//

/*import Foundation
import SwiftUI
//شاشة الدعم الفني
struct SupportView: View {
    @Binding var isWarmLightOn: Bool
    @Binding var selectedTheme: Int // ✅ دعم الثيمات الجديدة

    var body: some View {
        ZStack {
            // ✅ دعم الإضاءة الدافئة في الخلفية
            AppColor.background(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn)
                .ignoresSafeArea()
                .animation(.easeInOut(duration: 0.5), value: isWarmLightOn)

            VStack(alignment: .center, spacing: 20) {
                Text("الدعم الفني")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                    .padding(.bottom, 10)

                Text("إذا كنت بحاجة إلى المساعدة، يمكنك التواصل معنا عبر البريد الإلكتروني أو وسائل التواصل الاجتماعي.")
                    .font(.body)
                    .foregroundColor(AppColor.secondary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)

                // ✅ زر التواصل عبر البريد
                contactButton(title: "تواصل عبر البريد الإلكتروني", icon: "envelope.fill") {
                    let email = "support@example.com"
                    if let url = URL(string: "mailto:\(email)") {
                        UIApplication.shared.open(url)
                    }
                }

                // ✅ زر زيارة الموقع الرسمي
                contactButton(title: "زيارة الموقع الرسمي", icon: "globe") {
                    if let url = URL(string: "https://example.com") {
                        UIApplication.shared.open(url)
                    }
                }

                Spacer()
            }
            .padding()
        }
    }

    /// **🔹 دالة لإنشاء زر مخصص للتواصل**
    private func contactButton(title: String, icon: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .font(.title2)
                Text(title)
                    .font(.title3)
            }
            .foregroundColor(.white)
            .padding()
            .frame(width: 250)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(AppColor.accent(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                    .shadow(radius: 5)
            )
        }
        .padding(.top, 10)
    }
}*/
/*import Foundation
import SwiftUI

// شاشة دعم التطبيق
struct SupportView: View {
    @Binding var isWarmLightOn: Bool
    @Binding var selectedTheme: Int

    var body: some View {
        ZStack {
            AppColor.background(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn)
                .ignoresSafeArea()
                .animation(.easeInOut(duration: 0.5), value: isWarmLightOn)

            VStack(alignment: .center, spacing: 20) {
                Text("ادعم التطبيق")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                    .padding(.bottom, 10)

                Text("إذا أعجبك التطبيق، يمكنك دعمه من خلال تقييمه، مشاركته مع الأصدقاء، أو متابعتنا على وسائل التواصل.")
                    .font(.body)
                    .foregroundColor(AppColor.secondary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)

                // زر تقييم التطبيق
                supportButton(title: "قيّم التطبيق", icon: "star.fill") {
                    if let url = URL(string: "https://apps.apple.com/app/idYOUR_APP_ID") {
                        UIApplication.shared.open(url)
                    }
                }

                // زر مشاركة التطبيق
                supportButton(title: "مشاركة التطبيق", icon: "square.and.arrow.up") {
                    let textToShare = "أنصحك بتجربة هذا التطبيق الرائع: https://apps.apple.com/app/idYOUR_APP_ID"
                    let activityVC = UIActivityViewController(activityItems: [textToShare], applicationActivities: nil)
                    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                       let rootVC = windowScene.windows.first?.rootViewController {
                        rootVC.present(activityVC, animated: true, completion: nil)
                    }
                }

                Spacer()
            }
            .padding()
        }
    }

    /// 🔹 دالة لإنشاء زر مخصص لدعم التطبيق
    private func supportButton(title: String, icon: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .font(.title2)
                Text(title)
                    .font(.title3)
            }
            .foregroundColor(.white)
            .padding()
            .frame(width: 250)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(AppColor.accent(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                    .shadow(radius: 5)
            )
        }
        .padding(.top, 10)
    }
}*/
/*import SwiftUI
import Foundation

struct SupportView: View {
    @Binding var isWarmLightOn: Bool
    @Binding var selectedTheme: Int

    @State private var showThankYou = false

    var body: some View {
        ZStack {
            AppColor.background(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn)
                .ignoresSafeArea()
                .animation(.easeInOut(duration: 0.5), value: isWarmLightOn)

            VStack {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .center, spacing: 40) {
                        
                        // MARK: - شارك الأجر
                        VStack(spacing: 20) {
                            Text("شارك الأجر")
                                .font(.title)
                                .bold()
                                .foregroundColor(AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))

                            Text("""
إذا نال التطبيق إعجابك، فكن سببًا في نشر الخير بتقييمه أو مشاركته مع من تحب.
لعلّ أحدهم ينتفع به، فيكون لك مثل أجره بإذن الله 🤍
""")
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .foregroundColor(AppColor.secondary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))

                            supportButton(title: " قيّم التطبيق", icon: "star.fill") {
                                if let url = URL(string: "https://apps.apple.com/app/idYOUR_APP_ID") {
                                    UIApplication.shared.open(url)
                                }
                            }

                            supportButton(title: " مشاركة التطبيق", icon: "square.and.arrow.up") {
                                let textToShare = "أنصحك بتجربة هذا التطبيق: https://apps.apple.com/app/idYOUR_APP_ID"
                                let activityVC = UIActivityViewController(activityItems: [textToShare], applicationActivities: nil)
                                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                                   let rootVC = windowScene.windows.first?.rootViewController {
                                    rootVC.present(activityVC, animated: true, completion: nil)
                                }
                            }
                        }
                        .padding(.top, 40)

                        Divider().padding(.horizontal)
                           
                        // MARK: - دعم رمزي
                        VStack(spacing: 20) {
                           Text("دعم رمزي للتطبيق")
                               .padding(.bottom, 8) // أسفل العنوان

                               .font(.title)
                                .bold()
                                .foregroundColor(AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))

                            Text("""
لمن يرغب بالمساهمة في تطوير التطبيق واستمراره، يمكن تقديم دعم رمزي عبر Apple.
دعمك يُسهم في استمرار العمل وتطوير مزايا أكثر للمستخدمين 💛
""")
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .foregroundColor(AppColor.secondary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))

                            supportButton(title: " شارك بالدعم الرمزي", icon: "gift.fill") {
                                // 🔒 Placeholder – In-App Purchase will be integrated here in next update
                                showThankYou = true
                            }

                            Text("""
التطبيق مجاني وسيبقى كذلك بإذن الله.
الدعم اختياري لمن أراد أن يشارك في نشر الخير واستمرار العمل،
ونسأل الله أن يجعل الأجر للجميع خالصًا لوجهه الكريم.
""")
                                .font(.footnote)
                                .multilineTextAlignment(.center)
                                .foregroundColor(AppColor.secondary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                                .padding(.horizontal)
                                .padding(.top, 5)
                        }

                        Spacer(minLength: 80)
                    }
                    .padding()
                }
            }
        }
        .alert(isPresented: $showThankYou) {
            Alert(title: Text("شكرًا لك!"),
                  message: Text("نقدّر دعمك واهتمامك 💛"),
                  dismissButton: .default(Text("تم")))
        }
    }

    private func supportButton(title: String, icon: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .font(.title2)
                Text(title)
                    .font(.title3)
            }
            .foregroundColor(.white)
            .padding()
            .frame(width: 250)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(AppColor.accent(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                    .shadow(radius: 5)
            )
        }
    }
}*/
/*import SwiftUI
import Foundation

struct SupportView: View {
    @Binding var isWarmLightOn: Bool
    @Binding var selectedTheme: Int

    @State private var showThankYou = false

    var body: some View {
        ZStack {
            AppColor.background(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn)
                .ignoresSafeArea()
                .animation(.easeInOut(duration: 0.5), value: isWarmLightOn)

            VStack {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .center, spacing: 40) {
                        
                        // MARK: - شارك الأجر
                        VStack(spacing: 20) {
                            Text("شارك الأجر")
                                .font(.title)
                                .bold()
                                .foregroundColor(AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))

                            Text("""
إذا نال التطبيق إعجابك، فكن سببًا في نشر الخير بتقييمه أو مشاركته مع من تحب.
لعلّ أحدهم ينتفع به، فيكون لك مثل أجره بإذن الله 🤍
""")
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .foregroundColor(AppColor.secondary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))

                            supportButton(title: " قيّم التطبيق", icon: "star.fill") {
                                if let url = URL(string: "https://apps.apple.com/app/idYOUR_APP_ID") {
                                    UIApplication.shared.open(url)
                                }
                            }

                            supportButton(title: " مشاركة التطبيق", icon: "square.and.arrow.up") {
                                let textToShare = "أنصحك بتجربة هذا التطبيق: https://apps.apple.com/app/idYOUR_APP_ID"
                                let activityVC = UIActivityViewController(activityItems: [textToShare], applicationActivities: nil)
                                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                                   let rootVC = windowScene.windows.first?.rootViewController {
                                    rootVC.present(activityVC, animated: true, completion: nil)
                                }
                            }
                        }
                        .padding(.top, 40)

                        Divider().padding(.horizontal)

                        // MARK: - الدعم
                        VStack(spacing: 20) {
                            Text("""
لمن يرغب بالمساهمة في تطوير التطبيق واستمراره، يمكن تقديم دعم عبر Apple.
دعمك يُسهم في استمرار العمل وتطوير مزايا أكثر للمستخدمين 💛
""")
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .foregroundColor(AppColor.secondary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))

                            supportButton(title: " شارك بالدعم", icon: "gift.fill") {
                                // 🔒 Placeholder – In-App Purchase will be integrated here in next update
                                showThankYou = true
                            }

                            Text("""
التطبيق مجاني وسيبقى كذلك بإذن الله.
الدعم اختياري لمن أراد أن يشارك في نشر الخير واستمرار العمل،
ونسأل الله أن يجعل الأجر للجميع خالصًا لوجهه الكريم.
""")
                                .font(.footnote)
                                .multilineTextAlignment(.center)
                                .foregroundColor(AppColor.secondary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                                .padding(.horizontal)
                                .padding(.top, 5)
                        }

                        Spacer(minLength: 80)
                    }
                    .padding()
                }
            }
        }
        .alert(isPresented: $showThankYou) {
            Alert(title: Text("شكرًا لك!"),
                  message: Text("نقدّر دعمك واهتمامك 💛"),
                  dismissButton: .default(Text("تم")))
        }
    }

    private func supportButton(title: String, icon: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .font(.title2)
                Text(title)
                    .font(.title3)
            }
            .foregroundColor(.white)
            .padding()
            .frame(width: 250)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(AppColor.accent(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                    .shadow(radius: 5)
            )
        }
    }
}*/
/*import SwiftUI
import Foundation

struct SupportView: View {
    @Binding var isWarmLightOn: Bool
    @Binding var selectedTheme: Int

    @State private var showThankYou = false

    var body: some View {
        ZStack {
            AppColor.background(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn)
                .ignoresSafeArea()
                .animation(.easeInOut(duration: 0.5), value: isWarmLightOn)

            VStack {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .center, spacing: 20) {

                        // MARK: - شارك الأجر
                        VStack(spacing: 16) {
                            Text("شارك الأجر")
                                .font(.title)
                                .bold()
                                .foregroundColor(AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))

                            Text("""
إذا نال التطبيق إعجابك، فكن سببًا في نشر الخير بتقييمه أو مشاركته مع من تحب.
لعلّ أحدهم ينتفع به، فيكون لك مثل أجره بإذن الله 🤍
""")
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .foregroundColor(AppColor.secondary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))

                            supportButton(title: " قيّم التطبيق", icon: "star.fill") {
                                if let url = URL(string: "https://apps.apple.com/app/idYOUR_APP_ID") {
                                    UIApplication.shared.open(url)
                                }
                            }

                            supportButton(title: " مشاركة التطبيق", icon: "square.and.arrow.up") {
                                let textToShare = "أنصحك بتجربة هذا التطبيق: https://apps.apple.com/app/idYOUR_APP_ID"
                                let activityVC = UIActivityViewController(activityItems: [textToShare], applicationActivities: nil)
                                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                                   let rootVC = windowScene.windows.first?.rootViewController {
                                    rootVC.present(activityVC, animated: true, completion: nil)
                                }
                            }
                        }
                        .padding(.top, 20)

                        Divider().padding(.horizontal)

                        // MARK: - الدعم
                        VStack(spacing: 16) {
                            Text("""
لمن يرغب بالمساهمة في تطوير التطبيق واستمراره، يمكن تقديم دعم عبر Apple.
دعمك يُسهم في استمرار العمل وتطوير مزايا أكثر للمستخدمين 💛
""")
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .foregroundColor(AppColor.secondary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))

                            supportButton(title: " شارك بالدعم", icon: "gift.fill") {
                                // 🔒 سيتم تفعيل In-App Purchase هنا لاحقًا
                                showThankYou = true
                            }

                            Text("""
التطبيق مجاني وسيبقى كذلك بإذن الله.
الدعم اختياري لمن أراد أن يشارك في نشر الخير واستمرار العمل،
ونسأل الله أن يجعل الأجر للجميع خالصًا لوجهه الكريم.
""")
                                .font(.footnote)
                                .multilineTextAlignment(.center)
                                .foregroundColor(AppColor.secondary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                                .padding(.horizontal)
                                .padding(.top, 4)
                        }
                    }
                    .padding()
                }
            }
        }
        .alert(isPresented: $showThankYou) {
            Alert(title: Text("شكرًا لك!"),
                  message: Text("نقدّر دعمك واهتمامك، ونسأل الله أن يبارك فيك 🤍"),
                  dismissButton: .default(Text("تم")))
        }
    }

    private func supportButton(title: String, icon: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .font(.title2)
                Text(title)
                    .font(.title3)
            }
            .foregroundColor(.white)
            .padding()
            .frame(width: 250)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(AppColor.accent(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                    .shadow(radius: 5)
            )
        }
    }
}*/
/*import SwiftUI
import Foundation

struct SupportView: View {
    @Binding var isWarmLightOn: Bool
    @Binding var selectedTheme: Int

    @State private var showThankYou = false

    var body: some View {
        ZStack {
            AppColor.background(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn)
                .ignoresSafeArea()
                .animation(.easeInOut(duration: 0.5), value: isWarmLightOn)

            VStack {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .center, spacing: 20) {

                        // MARK: - شارك الأجر
                        VStack(spacing: 16) {
                            Text("شارك الأجر")
                                .font(.title)
                                .bold()
                                .foregroundColor(AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))

                            Text("""
إذا نال التطبيق إعجابك، فكن سببًا في نشر الخير بتقييمه أو مشاركته مع من تحب.
لعلّ أحدهم ينتفع به، فيكون لك مثل أجره بإذن الله
""")
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .foregroundColor(AppColor.secondary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))

                            supportButton(title: " قيّم التطبيق", icon: "star.fill") {
                                if let url = URL(string: "https://apps.apple.com/app/idYOUR_APP_ID") {
                                    UIApplication.shared.open(url)
                                }
                            }

                            supportButton(title: " مشاركة التطبيق", icon: "square.and.arrow.up") {
                                let textToShare = "أنصحك بتجربة هذا التطبيق: https://apps.apple.com/app/idYOUR_APP_ID"
                                let activityVC = UIActivityViewController(activityItems: [textToShare], applicationActivities: nil)
                                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                                   let rootVC = windowScene.windows.first?.rootViewController {
                                    rootVC.present(activityVC, animated: true, completion: nil)
                                }
                            }
                        }
                        .padding(.top, 20)

                        Divider().padding(.horizontal)

                        // MARK: - الدعم
                        VStack(spacing: 16) {
                            Text("""
لمن يرغب بالمساهمة في تطوير التطبيق واستمراره، يمكن تقديم دعم عبر Apple.
دعمك يُسهم في استمرار العمل وتطوير مزايا أكثر للمستخدمين
""")
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .foregroundColor(AppColor.secondary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))

                            supportButton(title: " شارك بالدعم", icon: "gift.fill") {
                                // 🔒 سيتم تفعيل In-App Purchase هنا لاحقًا
                                showThankYou = true
                            }

                            Text("""
التطبيق مجاني وسيبقى كذلك بإذن الله.
الدعم اختياري لمن أراد أن يشارك في نشر الخير واستمرار العمل،
ونسأل الله أن يجعل الأجر للجميع خالصًا لوجهه الكريم.
""")
                                .font(.footnote)
                                .multilineTextAlignment(.center)
                                .foregroundColor(AppColor.secondary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                                .padding(.horizontal)
                                .padding(.top, 4)
                        }
                    }
                    .padding()
                }
            }
        }
        .alert(isPresented: $showThankYou) {
            Alert(title: Text("شكرًا لك!"),
                  message: Text("نقدّر دعمك واهتمامك، ونسأل الله أن يبارك فيك 🤍"),
                  dismissButton: .default(Text("تم")))
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                       let rootVC = windowScene.windows.first?.rootViewController {
                        rootVC.dismiss(animated: true, completion: nil)
                    }
                }) {
                    Image(systemName: "chevron.backward")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                }
            }
        }
    }

    private func supportButton(title: String, icon: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .font(.title2)
                Text(title)
                    .font(.title3)
            }
            .foregroundColor(.white)
            .padding()
            .frame(width: 250)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(AppColor.accent(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                    .shadow(radius: 5)
            )
        }
    }
}*/
/*import SwiftUI
import Foundation

struct SupportView: View {
    @Binding var isWarmLightOn: Bool
    @Binding var selectedTheme: Int
    
    // ⬅️ زر الرجوع
    @Environment(\.dismiss) private var dismiss
    @State private var showThankYou = false

    var body: some View {
        ZStack {
            AppColor.background(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn)
                .ignoresSafeArea()
                .animation(.easeInOut(duration: 0.5), value: isWarmLightOn)

            VStack {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .center, spacing: 20) {

                        // MARK: - شارك الأجر
                        VStack(spacing: 16) {
                            Text("شارك الأجر")
                                .font(.title)
                                .bold()
                                .foregroundColor(AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))

                            Text("""
إذا نال التطبيق إعجابك، فكن سببًا في نشر الخير بتقييمه أو مشاركته مع من تحب.
لعلّ أحدهم ينتفع به، فيكون لك مثل أجره بإذن الله 🤍
""")
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .foregroundColor(AppColor.secondary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))

                            supportButton(title: " قيّم التطبيق", icon: "star.fill") {
                                if let url = URL(string: "https://apps.apple.com/app/idYOUR_APP_ID") {
                                    UIApplication.shared.open(url)
                                }
                            }

                            supportButton(title: " مشاركة التطبيق", icon: "square.and.arrow.up") {
                                let textToShare = "من أعان على خير، فله مثل أجره بإذن الله 🤍 جرّب هذا التطبيق: https://apps.apple.com/app/idYOUR_APP_ID"

                                let activityVC = UIActivityViewController(activityItems: [textToShare], applicationActivities: nil)
                                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                                   let rootVC = windowScene.windows.first?.rootViewController {
                                    rootVC.present(activityVC, animated: true, completion: nil)
                                }
                            }
                        }
                        .padding(.top, 20)

                        Divider().padding(.horizontal)

                        // MARK: - الدعم
                        VStack(spacing: 16) {
                            Text("""
لمن يرغب بالمساهمة في تطوير التطبيق واستمراره، يمكن تقديم دعم عبر Apple.
دعمك يُسهم في استمرار العمل وتطوير مزايا أكثر للمستخدمين 💛
""")
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .foregroundColor(AppColor.secondary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))

                            supportButton(title: " شارك بالدعم", icon: "gift.fill") {
                                showThankYou = true
                            }

                            Text("""
التطبيق مجاني وسيبقى كذلك بإذن الله.
الدعم اختياري لمن أراد أن يشارك في نشر الخير واستمرار العمل،
ونسأل الله أن يجعل الأجر للجميع خالصًا لوجهه الكريم.
""")
                                .font(.footnote)
                                .multilineTextAlignment(.center)
                                .foregroundColor(AppColor.secondary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                                .padding(.horizontal)
                                .padding(.top, 4)
                        }
                    }
                    .padding()
                }
            }
        }
        .alert(isPresented: $showThankYou) {
            Alert(title: Text("شكرًا لك!"),
                  message: Text("نقدّر دعمك واهتمامك، ونسأل الله أن يبارك فيك 🤍"),
                  dismissButton: .default(Text("تم")))
        }

        // ✅ زر الرجوع بالأيقونة فقط
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.backward")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                        .padding(8)
                        .background(Color.clear)
                        .clipShape(Circle())
                }
            }
        }
    }

    // ✅ زر مخصص
    private func supportButton(title: String, icon: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .font(.title2)
                Text(title)
                    .font(.title3)
            }
            .foregroundColor(.white)
            .padding()
            .frame(width: 250)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(AppColor.accent(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                    .shadow(radius: 5)
            )
        }
    }
}*/

import SwiftUI
import StoreKit

struct SupportView: View {
    @Binding var isWarmLightOn: Bool
    @Binding var selectedTheme: Int
    @Environment(\.dismiss) private var dismiss
    @State private var showThankYou = false
    @State private var products: [Product] = []
    @State private var purchaseInProgress = false

    let productIDs = ["support_29_99", "support_89_99", "support_399_99"]

    var body: some View {
        ZStack {
            AppColor.background(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn)
                .ignoresSafeArea()
                .animation(.easeInOut(duration: 0.5), value: isWarmLightOn)

            VStack {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .center, spacing: 20) {

                        // MARK: - شارك الأجر
                        VStack(spacing: 16) {
                            Text("شارك الأجر")
                                .font(.title)
                                .bold()
                                .foregroundColor(AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))

                            Text("""
إذا نال التطبيق إعجابك، فكن سببًا في نشر الخير بتقييمه أو مشاركته مع من تحب.
لعلّ أحدهم ينتفع به، فيكون لك مثل أجره بإذن الله 🤍
""")
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .foregroundColor(AppColor.secondary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))

                            supportButton(title: " قيّم التطبيق", icon: "star.fill") {
                                if let url = URL(string: "https://apps.apple.com/app/id6744103046") {
                                    UIApplication.shared.open(url)
                                }
                            }

                            supportButton(title: " مشاركة التطبيق", icon: "square.and.arrow.up") {
                                let textToShare = "من أعان على خير، فله مثل أجره بإذن الله 🤍 جرّب هذا التطبيق: https://apps.apple.com/app/id6744103046"
                                let activityVC = UIActivityViewController(activityItems: [textToShare], applicationActivities: nil)
                                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                                   let rootVC = windowScene.windows.first?.rootViewController {
                                    rootVC.present(activityVC, animated: true, completion: nil)
                                }
                            }
                        }
                        .padding(.top, 20)

                        Divider().padding(.horizontal)

                        // MARK: - الدعم
                        VStack(spacing: 16) {
                            Text("""
لمن يرغب بالمساهمة في تطوير التطبيق واستمراره، يمكن تقديم دعم عبر Apple.
دعمك يُسهم في استمرار العمل وتطوير مزايا أكثر للمستخدمين 💛
""")
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .foregroundColor(AppColor.secondary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))

                            // منتجات الدعم
                            ForEach(products, id: \.id) { product in
                                supportButton(title: "دعم بـ \(product.displayPrice)", icon: "gift.fill") {
                                    Task {
                                        do {
                                            purchaseInProgress = true
                                            let result = try await product.purchase()
                                            if case .success = result {
                                                showThankYou = true
                                            }
                                        } catch {
                                            print("خطأ في الشراء: \(error)")
                                        }
                                        purchaseInProgress = false
                                    }
                                }
                            }

                            Text("""
التطبيق مجاني وسيبقى كذلك بإذن الله.
الدعم اختياري لمن أراد أن يشارك في نشر الخير واستمرار العمل،
ونسأل الله أن يجعل الأجر للجميع خالصًا لوجهه الكريم.
""")
                                .font(.footnote)
                                .multilineTextAlignment(.center)
                                .foregroundColor(AppColor.secondary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                                .padding(.horizontal)
                                .padding(.top, 4)
                        }
                    }
                    .padding()
                }
            }
        }
        .onAppear {
            loadProducts()
        }
        .alert(isPresented: $showThankYou) {
            Alert(title: Text("شكرًا لك!"),
                  message: Text("نقدّر دعمك واهتمامك، ونسأل الله أن يبارك فيك 🤍"),
                  dismissButton: .default(Text("تم")))
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.backward")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                        .padding(8)
                        .background(Color.clear)
                        .clipShape(Circle())
                }
            }
        }
    }

    // زر الدعم والمشاركة
    private func supportButton(title: String, icon: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .font(.title2)
                Text(title)
                    .font(.title3)
            }
            .foregroundColor(.white)
            .padding()
            .frame(width: 250)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(AppColor.accent(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                    .shadow(radius: 5)
            )
        }
        .disabled(purchaseInProgress)
    }

    // تحميل منتجات الشراء من App Store
    private func loadProducts() {
        Task {
            do {
                products = try await Product.products(for: productIDs)
                if products.isEmpty {
                    print("لا توجد منتجات!")
                } else {
                    print("تم تحميل المنتجات: \(products)")
                }
            } catch {
                print("فشل تحميل المنتجات: \(error)")
            }
        }
    }
}
/*import SwiftUI
import StoreKit

struct SupportView: View {
    @Binding var isWarmLightOn: Bool
    @Binding var selectedTheme: Int
    @Environment(\.dismiss) private var dismiss
    @State private var showThankYou = false
    @State private var products: [Product] = []
    @State private var purchaseInProgress = false

    let productIDs = ["support_29_99", "support_89_99", "support_399_99"]

    var body: some View {
        ZStack {
            AppColor.background(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn)
                .ignoresSafeArea()
                .animation(.easeInOut(duration: 0.5), value: isWarmLightOn)

            VStack {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .center, spacing: 20) {
                        
                        // MARK: - شارك الأجر
                        VStack(spacing: 16) {
                            Text("شارك الأجر")
                                .font(.title)
                                .bold()
                                .foregroundColor(AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))

                            Text("""
إذا نال التطبيق إعجابك، فكن سببًا في نشر الخير بتقييمه أو مشاركته مع من تحب.
لعلّ أحدهم ينتفع به، فيكون لك مثل أجره بإذن الله 🤍
""")
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .foregroundColor(AppColor.secondary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))

                            supportButton(title: " قيّم التطبيق", icon: "star.fill") {
                                if let url = URL(string: "https://apps.apple.com/app/id6744103046") {
                                    UIApplication.shared.open(url)
                                }
                            }

                            supportButton(title: " مشاركة التطبيق", icon: "square.and.arrow.up") {
                                let textToShare = "من أعان على خير، فله مثل أجره بإذن الله 🤍 جرّب هذا التطبيق: https://apps.apple.com/app/id6744103046"
                                let activityVC = UIActivityViewController(activityItems: [textToShare], applicationActivities: nil)
                                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                                   let rootVC = windowScene.windows.first?.rootViewController {
                                    rootVC.present(activityVC, animated: true, completion: nil)
                                }
                            }
                        }
                        .padding(.top, 20)

                        Divider().padding(.horizontal)

                        // MARK: - الدعم
                        VStack(spacing: 16) {
                            Text("""
لمن يرغب بالمساهمة في تطوير التطبيق واستمراره، يمكن تقديم دعم عبر Apple.
دعمك يُسهم في استمرار العمل وتطوير مزايا أكثر للمستخدمين 💛
""")
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .foregroundColor(AppColor.secondary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))

                            // منتجات الدعم
                            ForEach(products, id: \.id) { product in
                                supportButton(title: "دعم بـ \(product.displayPrice)", icon: "gift.fill") {
                                    Task {
                                        do {
                                            purchaseInProgress = true
                                            let result = try await product.purchase()
                                            if case .success = result {
                                                showThankYou = true
                                            }
                                        } catch {
                                            print("خطأ في الشراء: \(error)")
                                        }
                                        purchaseInProgress = false
                                    }
                                }
                            }

                            Text("""
التطبيق مجاني وسيبقى كذلك بإذن الله.
الدعم اختياري لمن أراد أن يشارك في نشر الخير واستمرار العمل،
ونسأل الله أن يجعل الأجر للجميع خالصًا لوجهه الكريم.
""")
                                .font(.footnote)
                                .multilineTextAlignment(.center)
                                .foregroundColor(AppColor.secondary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                                .padding(.horizontal)
                                .padding(.top, 4)
                        }
                    }
                    .padding()
                }
            }
        }
        .onAppear {
            loadProducts()
        }
        .alert(isPresented: $showThankYou) {
            Alert(title: Text("شكرًا لك!"),
                  message: Text("نقدّر دعمك واهتمامك، ونسأل الله أن يبارك فيك 🤍"),
                  dismissButton: .default(Text("تم")))
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.backward")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(AppColor.primary(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                        .padding(8)
                        .background(Color.clear)
                        .clipShape(Circle())
                }
            }
        }
    }

    // ✅ زر الدعم والمشاركة والتقييم
    private func supportButton(title: String, icon: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .font(.title2)
                Text(title)
                    .font(.title3)
            }
            .foregroundColor(.white)
            .padding()
            .frame(width: 250)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(AppColor.accent(forTheme: selectedTheme, isWarmLightOn: isWarmLightOn))
                    .shadow(radius: 5)
            )
        }
        .disabled(purchaseInProgress)
    }

    // ✅ تحميل منتجات الشراء من App Store
    private func loadProducts() {
        Task {
            do {
                products = try await Product.products(for: productIDs)
            } catch {
                print("فشل تحميل المنتجات: \(error)")
            }
        }
    }
}*/
