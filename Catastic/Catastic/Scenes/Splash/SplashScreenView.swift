//
//  Splash.swift
//  Catastic
//
//  Created by André  Costa Dantas on 18/05/25.
//

import Foundation
import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false

    var body: some View {
        if isActive {
            CatListView()
        } else {
            ZStack {
                Color.white.ignoresSafeArea()

                VStack {
                    LottieView(animationName: "cat_animation", loopMode: .playOnce)
                        .frame(width: 200, height: 200)

                    Text("Catastic 😺")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 24)
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}
