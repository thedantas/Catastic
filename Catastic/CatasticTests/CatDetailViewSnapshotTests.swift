//
//  CatDetailViewSnapshotTests.swift
//  CatasticTests
//
//  Created by André  Costa Dantas on 18/05/25.
//

import Foundation
import XCTest
import SwiftUI
import SnapshotTesting

@testable import Catastic

final class CatDetailViewSnapshotTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    func testCatDetailViewSnapshot() {
        let mockCat = CatItem(
            id: "abc123",
            tags: ["playful", "cute", "black"],
            mimetype: "image/jpeg",
            createdAt: "2023-01-01T12:00:00Z"
        )

        let view = CatDetailView(cat: mockCat)
            .frame(width: 390, height: 844) // iPhone 14

        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhoneXsMax)),
                       record: false)
    }
}
