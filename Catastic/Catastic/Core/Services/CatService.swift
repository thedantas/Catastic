//
//  CatService.swift
//  Catastic
//
//  Created by André  Costa Dantas on 15/05/25.
//

import Foundation
import Combine

class CatService {
    private let client: NetworkClientProtocol

    init(client: NetworkClientProtocol = NetworkClient()) {
        self.client = client
    }

    func fetchCatList() -> AnyPublisher<[CatItem], NetworkError> {
        guard let url = Endpoints.catListURL() else {
            return Fail(error: .invalidURL).eraseToAnyPublisher()
        }
        return client.request(url)
    }
}
