//
//  CatListViewModel.swift
//  Catastic
//
//  Created by André  Costa Dantas on 15/05/25.
//

import Foundation
import Combine

class CatListViewModel: ObservableObject {
    @Published var catCards: [(cat: CatItem, imageURL: URL)] = []
    @Published var isLoading = false
    @Published var error: String?

    private let service = CatService()
    private var cancellables = Set<AnyCancellable>()

    func fetchCats() {
        isLoading = true
        service.fetchCatList()
            .receive(on: DispatchQueue.main)
            .map { cats in
                cats.map { cat in
                    (cat, Endpoints.catImageURL(id: cat.id))
                }
            }
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                if case .failure(let error) = completion {
                    self?.error = error.localizedDescription
                }
            }, receiveValue: { [weak self] catCards in
                self?.catCards = catCards
            })
            .store(in: &cancellables)
    }
}
