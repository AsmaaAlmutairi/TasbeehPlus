//
//  ActivityView.swift
//  Tasbeeh+ | تسبيح
//
//  Created by A Sky on 13/09/1446 AH.
//


import Foundation
import SwiftUI
//واجهة لمشاركة الأذكار عبر التطبيقات الأخرى
struct ActivityView: UIViewControllerRepresentable {
    var activityItems: [Any]

    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}
