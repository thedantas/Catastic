//
//  CatListViewSnapshotTests.swift
//  CatasticTests
//
//  Created by André  Costa Dantas on 18/05/25.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import Catastic

final class CatListViewSnapshotTests: XCTestCase {

    override func setUp() {
        super.setUp()
        isRecording = false
    }

    func testCatListViewSnapshot() {
        let sampleCat = CatItem(
            id: "abc123",
            tags: ["cute", "sleepy"],
            mimetype: "image/jpeg",
            createdAt: "2023-01-01T12:00:00Z"
        )

        let imageURL = Endpoints.catImageURL(id: sampleCat.id)
        let viewModel = CatListViewModelMock(
            catCards: [(sampleCat, imageURL)]
        )

        let view = CatListView(viewModel: viewModel)
            .frame(width: 390, height: 844)

        assertSnapshot(matching: view, as: .image(layout: .fixed(width: 390, height: 844)))
    }
}
