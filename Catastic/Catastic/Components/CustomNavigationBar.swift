//
//  CustomNavigationBar.swift
//  Catastic
//
//  Created by André  Costa Dantas on 18/05/25.
//

import SwiftUI

struct CustomNavigationBar: View {
    @Environment(\.presentationMode) var presentationMode
    var title: String? = nil

    var body: some View {
        HStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .bold))
                    .padding(10)
                    .background(Color.white.opacity(0.8))
                    .clipShape(Circle())
                    .shadow(radius: 2)
            }
            .accessibilityIdentifier("backButton")
            if let title = title {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding(.leading, 8)
            }

            Spacer()
        }
        .padding(.top, 50)
        .padding(.horizontal, 20)
    }
}
