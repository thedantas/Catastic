//
//  MockNetworkClient.swift
//  CatasticTests
//
//  Created by André  Costa Dantas on 18/05/25.
//

import Foundation
import Combine
@testable import Catastic

class MockNetworkClient: NetworkClientProtocol {
    var mockData: Data?
    var shouldFail: Bool = false

    func request<T: Decodable>(_ url: URL) -> AnyPublisher<T, NetworkError> {
        if shouldFail {
            return Fail(error: NetworkError.other(NSError(domain: "MockError", code: -1)))
                .eraseToAnyPublisher()
        }

        guard let data = mockData else {
            return Fail(error: NetworkError.invalidURL)
                .eraseToAnyPublisher()
        }

        do {
            let decoded = try JSONDecoder().decode(T.self, from: data)
            return Just(decoded)
                .setFailureType(to: NetworkError.self)
                .eraseToAnyPublisher()
        } catch {
            return Fail(error: NetworkError.decoding(error))
                .eraseToAnyPublisher()
        }
    }
}
