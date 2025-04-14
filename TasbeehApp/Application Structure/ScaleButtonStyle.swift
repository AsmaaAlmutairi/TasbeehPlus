//
//  ScaleButtonStyle.swift
//  Tasbeeh+ | تسبيح
//
//  Created by A Sky on 18/09/1446 AH.
//

import Foundation
import SwiftUI

struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}
