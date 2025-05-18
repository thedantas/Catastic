//
//  CatDetailView.swift
//  Catastic
//
//  Created by André  Costa Dantas on 15/05/25.
//

import SwiftUI
import SwiftUICore

struct CatDetailView: View {
    @StateObject private var viewModel = CatDetailViewModel()
    let cat: CatItem
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(spacing: 0) {
                    ZStack(alignment: .topLeading) {
                        if let url = viewModel.imageURL {
                            AsyncImage(url: url) { phase in
                                switch phase {
                                case .empty:
                                    ShimmerPlaceholder()
                                        .frame(height: geometry.size.height * 0.5)
                                        .padding(.horizontal)
                                case .success(let image):
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(height: geometry.size.height * 0.5)
                                        .clipped()
                                case .failure:
                                    Color.red
                                        .frame(height: geometry.size.height * 0.5)
                                @unknown default:
                                    EmptyView()
                                }
                            }
                        } else {
                            ShimmerPlaceholder()
                                .frame(height: geometry.size.height * 0.5)
                                .padding(.horizontal)
                        }

                        CustomNavigationBar()
                    }

                    VStack(alignment: .leading, spacing: 20) {
                        Text("Tags")
                            .font(.title2)
                            .bold()

                        if cat.tags.isEmpty {
                            Text("No tags available")
                                .foregroundColor(.gray)
                        } else {
                            WrapHStack(tags: cat.tags)
                        }

                        VStack(alignment: .leading, spacing: 8) {
                            Text("MIME Type:")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            Text(cat.mimetype)
                                .font(.body)

                            Text("Created At:")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            Text(cat.createdAt.formattedDateFromISO())
                                .font(.body)
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, minHeight: geometry.size.height * 0.5)
                    .background(Color.white)
                    .cornerRadius(24)
                    .offset(y: -24)
                }
            }
            .ignoresSafeArea(edges: .top)
            .background(Color(.systemGroupedBackground))
            .navigationBarBackButtonHidden(true)
            .onAppear {
                viewModel.fetchDetails(for: cat.id)
            }
        }
    }
}
