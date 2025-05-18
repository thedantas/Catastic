//
//  CatListView.swift
//  Catastic
//
//  Created by André  Costa Dantas on 15/05/25.
//

import Foundation
import SwiftUICore
import SwiftUI

struct CatListView: View {
    @StateObject private var viewModel: CatListViewModel

    init(viewModel: CatListViewModel = CatListViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    private let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(viewModel.catCards, id: \.cat.id) { pair in
                        NavigationLink(destination: CatDetailView(cat: pair.cat)) {
                            CatCardView(cat: pair.cat, imageURL: pair.imageURL)
                                .frame(height: 180)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding()
            }
            .navigationTitle("Catastic 😺")
            .onAppear {
                viewModel.fetchCats()
            }
        }
    }
}
