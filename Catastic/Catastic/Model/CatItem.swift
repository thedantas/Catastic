//
//  CatItem.swift
//  Catastic
//
//  Created by André  Costa Dantas on 15/05/25.
//

import Foundation

struct CatItem: Decodable, Identifiable {
    var id: String
    var tags: [String]
    var mimetype: String
    var createdAt: String
}
