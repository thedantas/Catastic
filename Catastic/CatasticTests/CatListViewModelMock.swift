//
//  CatListViewModelMock.swift
//  CatasticTests
//
//  Created by André  Costa Dantas on 18/05/25.
//

import Foundation
@testable import Catastic

class CatListViewModelMock: CatListViewModel {
    init(catCards: [(CatItem, URL)]) {
        super.init()
        self.catCards = catCards
    }

    override func fetchCats() {
    }
}
