//
//  CatCardView.swift
//  Catastic
//
//  Created by André  Costa Dantas on 15/05/25.
//

import Foundation
import SwiftUI

struct CatCardView: View {
    let cat: CatItem
    let imageURL: URL

    @State private var appeared = false
    @State private var scale: CGFloat = 1.0
    @State private var showShimmer = true

    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .bottomLeading) {
                AsyncImage(url: imageURL) { phase in
                    switch phase {
                    case .empty:
                        ShimmerPlaceholder()
                            .frame(width: geo.size.width, height: geo.size.height)

                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: geo.size.width, height: geo.size.height)
                            .clipped()

                    case .failure:
                        Color.red.opacity(0.3)
                            .overlay(Text("Error Loading image").foregroundColor(.white))

                    @unknown default:
                        EmptyView()
                    }
                }

                if !cat.tags.isEmpty {
                    Text(cat.tags.joined(separator: ", "))
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color.black.opacity(0.6))
                        .cornerRadius(10)
                        .padding([.leading, .bottom], 12)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(color: .black.opacity(0.1), radius: 6, x: 0, y: 4)
            .scaleEffect(scale * (appeared ? 1 : 0.8))
            .opacity(appeared ? 1 : 0)
            .onAppear {
                withAnimation(.spring(response: 0.5, dampingFraction: 0.75)) {
                    appeared = true
                }
                updateScale(from: geo)
            }
            .onChange(of: geo.frame(in: .global).minY) { _ in
                updateScale(from: geo)
            }
        }
        .frame(height: 180)
    }

    private func updateScale(from geo: GeometryProxy) {
        let minY = geo.frame(in: .global).minY
        let screenHeight = UIScreen.main.bounds.height
        let diff = abs(minY - screenHeight / 2)
        let dynamicScale = max(0.9, 1 - (diff / screenHeight) * 0.1)
        self.scale = dynamicScale
    }
}
