//
//  FlexibleViewSnapshotTests.swift
//  CatasticTests
//
//  Created by André  Costa Dantas on 18/05/25.
//

import XCTest
import SwiftUI
import SnapshotTesting

@testable import Catastic

final class FlexibleViewSnapshotTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    func testFlexibleViewSnapshot() {
        let tags = ["cute", "sleepy", "playful", "hungry", "fluffy", "lazy", "zoomies"]

        let view = FlexibleView(data: tags) { tag in
            Text(tag)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(Color.blue.opacity(0.2))
                .foregroundColor(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .padding()
        .frame(width: 390, height: 200)

        assertSnapshot(
            matching: view,
            as: .image(layout: .fixed(width: 390, height: 200)),
            record: false
        )
    }
}
