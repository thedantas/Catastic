//
//  CustomNavigationBarSnapshotTests.swift
//  CatasticTests
//
//  Created by André  Costa Dantas on 18/05/25.
//

import Foundation
import XCTest
import SwiftUI
import SnapshotTesting
@testable import Catastic

final class CustomNavigationBarSnapshotTests: XCTestCase {

    func testCustomNavigationBarWithTitle() {
        let view = CustomNavigationBar(title: "Catastic 😺")
            .frame(width: 390, height: 100)

        assertSnapshot(
            matching: view,
            as: .image(layout: .fixed(width: 390, height: 100)),
            record: false
        )
    }

    func testCustomNavigationBarWithoutTitle() {
        let view = CustomNavigationBar()
            .frame(width: 390, height: 100)

        assertSnapshot(
            matching: view,
            as: .image(layout: .fixed(width: 390, height: 100)),
            record: false
        )
    }
}
