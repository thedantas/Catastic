//
//  NetworkClient.swift
//  Catastic
//
//  Created by André  Costa Dantas on 15/05/25.
//

import Foundation
import Combine

enum NetworkError: Error {
    case invalidURL
    case decoding(Error)
    case other(Error)
}

protocol NetworkClientProtocol {
    func request<T: Decodable>(_ url: URL) -> AnyPublisher<T, NetworkError>
}

class NetworkClient: NetworkClientProtocol {
    func request<T: Decodable>(_ url: URL) -> AnyPublisher<T, NetworkError> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { NetworkError.decoding($0) }
            .eraseToAnyPublisher()
    }
}
