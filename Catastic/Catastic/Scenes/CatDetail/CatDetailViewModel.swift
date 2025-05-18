//
//  CatDetailViewModel.swift
//  Catastic
//
//  Created by André  Costa Dantas on 15/05/25.
//

import Foundation
import Combine

class CatDetailViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var error: String?
    @Published var imageURL: URL?

    private let service = CatService()
    private var cancellables = Set<AnyCancellable>()

    func fetchDetails(for id: String) {
        isLoading = true
        imageURL = Endpoints.catImageURL(id: id)

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.isLoading = false
        }
    }
}
