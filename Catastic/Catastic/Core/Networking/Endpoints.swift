//
//  Endpoints.swift
//  Catastic
//
//  Created by André  Costa Dantas on 15/05/25.
//

import Foundation

enum Endpoints {
    static func catListURL() -> URL? {
        URL(string: "https://cataas.com/api/cats?limit=10")
    }

    static func catImageURL(id: String) -> URL {
        URL(string: "https://cataas.com/cat/\(id)")!
    }
}
