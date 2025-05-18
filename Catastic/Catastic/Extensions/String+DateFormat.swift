//
//  String+DateFormat.swift
//  Catastic
//
//  Created by André  Costa Dantas on 18/05/25.
//

import Foundation

extension String {
    func formattedDateFromISO() -> String {
        let isoFormatter = ISO8601DateFormatter()
        guard let date = isoFormatter.date(from: self) else { return self }

        let displayFormatter = DateFormatter()
        displayFormatter.dateStyle = .medium
        displayFormatter.timeStyle = .short

        return displayFormatter.string(from: date)
    }
}
