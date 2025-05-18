//
//  WrapHStack.swift
//  Catastic
//
//  Created by André  Costa Dantas on 18/05/25.
//

import Foundation
import SwiftUI

struct WrapHStack: View {
    let tags: [String]
    var body: some View {
        FlexibleView(data: tags, spacing: 8, alignment: .leading) { tag in
            Text(tag)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(Color.blue.opacity(0.2))
                .foregroundColor(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}
