//
//  KeyboardResponsive.swift
//  TasbeehPlus
//
//  Created by A Sky on 19/10/1446 AH.
//

import Foundation
import SwiftUI
import Combine

extension Publishers {
    static var keyboardHeight: AnyPublisher<CGFloat, Never> {
        let willShow = NotificationCenter.default
            .publisher(for: UIResponder.keyboardWillShowNotification)
            .compactMap { ($0.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height }

        let willHide = NotificationCenter.default
            .publisher(for: UIResponder.keyboardWillHideNotification)
            .map { _ in CGFloat(0) }

        return Publishers.Merge(willShow, willHide)
            .eraseToAnyPublisher()
    }
}

struct KeyboardResponsiveModifier: ViewModifier {
    @State private var keyboardHeight: CGFloat = 0
    let offset: CGFloat

    func body(content: Content) -> some View {
        content
            .padding(.bottom, keyboardHeight)
            .onReceive(Publishers.keyboardHeight) { height in
                withAnimation {
                    keyboardHeight = height > 0 ? height + offset : 0
                }
            }
    }
}

extension View {
    func keyboardResponsive(offset: CGFloat = 0) -> some View {
        self.modifier(KeyboardResponsiveModifier(offset: offset))
    }
}
