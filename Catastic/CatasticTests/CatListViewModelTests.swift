//
//  CatListViewModelTests.swift
//  CatasticTests
//
//  Created by André  Costa Dantas on 18/05/25.
//

import XCTest
import Combine
@testable import Catastic

final class CatListViewModelTests: XCTestCase {
    var viewModel: CatListViewModel!
    var cancellables: Set<AnyCancellable> = []

    func testFetchCatsSuccess() {
        // Given
        let mockClient = MockNetworkClient()
        let expectedCats = [
            CatItem(id: "123", tags: ["cute"], mimetype: "image/jpeg", createdAt: "2022-01-01T00:00:00.000Z")
        ]
        let jsonData = try! JSONEncoder().encode(expectedCats)
        mockClient.mockData = jsonData

        let service = CatService(client: mockClient)
        viewModel = CatListViewModel(service: service)

        let expectation = XCTestExpectation(description: "Fetch cats")

        // When
        viewModel.$catCards
            .dropFirst()
            .sink { catCards in
                // Then
                XCTAssertEqual(catCards.count, 1)
                XCTAssertEqual(catCards[0].cat.id, "123")
                XCTAssertEqual(catCards[0].imageURL.absoluteString, "https://cataas.com/cat/123")
                expectation.fulfill()
            }
            .store(in: &cancellables)

        viewModel.fetchCats()
        wait(for: [expectation], timeout: 2)
    }

    func testFetchCatsFailure() {
        let mockClient = MockNetworkClient()
        mockClient.shouldFail = true

        let service = CatService(client: mockClient)
        viewModel = CatListViewModel(service: service)

        let expectation = XCTestExpectation(description: "Handle error")

        viewModel.$error
            .dropFirst()
            .sink { error in
                XCTAssertNotNil(error)
                expectation.fulfill()
            }
            .store(in: &cancellables)

        viewModel.fetchCats()
        wait(for: [expectation], timeout: 2)
    }
}
