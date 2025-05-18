//
//  FlexibleView.swift
//  Catastic
//
//  Created by André  Costa Dantas on 18/05/25.
//

import Foundation
import SwiftUI

struct FlexibleView<Data: Collection, Content: View>: View where Data.Element: Hashable {
    let data: Data
    let spacing: CGFloat
    let alignment: HorizontalAlignment
    let content: (Data.Element) -> Content

    init(data: Data,
         spacing: CGFloat = 8,
         alignment: HorizontalAlignment = .leading,
         @ViewBuilder content: @escaping (Data.Element) -> Content) {
        self.data = data
        self.spacing = spacing
        self.alignment = alignment
        self.content = content
    }

    var body: some View {
        var _: [[Data.Element]] = [[]]
        var _: CGFloat = 0
        _ = UIScreen.main.bounds.width - 32

        ForEach(Array(data), id: \.self) { item in
            let itemView = content(item)
            itemView
                .fixedSize()
                .padding(4)
        }

        return VStack(alignment: alignment, spacing: spacing) {
            GeometryReader { geometry in
                self.generateContent(in: geometry)
            }
        }
    }

    private func generateContent(in geometry: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var rows: [[Data.Element]] = [[]]

        return VStack(alignment: alignment, spacing: spacing) {
            ForEach(self.computeRows(in: geometry.size.width), id: \.self) { row in
                HStack(spacing: spacing) {
                    ForEach(row, id: \.self) { item in
                        content(item)
                    }
                }
            }
        }
    }

    private func computeRows(in totalWidth: CGFloat) -> [[Data.Element]] {
        var rows: [[Data.Element]] = [[]]
        var currentRowWidth: CGFloat = 0

        for item in data {
            let itemWidth: CGFloat = 100
            if currentRowWidth + itemWidth > totalWidth {
                rows.append([item])
                currentRowWidth = itemWidth
            } else {
                rows[rows.count - 1].append(item)
                currentRowWidth += itemWidth + spacing
            }
        }
        return rows
    }
}
