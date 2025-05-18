//
//  ShimmerPlaceholder.swift
//  Catastic
//
//  Created by André  Costa Dantas on 18/05/25.
//

import Foundation
import SwiftUI

struct ShimmerPlaceholder: View {
    @State private var gradientX: CGFloat = -1.0

    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [Color.gray.opacity(0.3), Color.gray.opacity(0.1), Color.gray.opacity(0.3)]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .mask(
                Rectangle()
                    .fill(Color.white)
                    .opacity(0.8)
                    .overlay(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.clear, Color.white.opacity(0.6), Color.clear]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                        .offset(x: gradientX * UIScreen.main.bounds.width)
                    )
            )
            .onAppear {
                withAnimation(
                    Animation.linear(duration: 1.2)
                        .repeatForever(autoreverses: false)
                ) {
                    gradientX = 2.0
                }
            }
    }
}
