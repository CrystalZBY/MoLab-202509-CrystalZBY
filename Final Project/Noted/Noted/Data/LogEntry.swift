//
//  LogEntry.swift
//  Noted
//
//  Created by Crystal Zhang on 11/21/25.
//

import Foundation

// Define a protocal, each life area entry satisfies the custom protocal
protocol LogEntry: Identifiable, Codable {
    var id: UUID { get }
    var date: Date { get }
    var notes: String { get } // free-text input
    var tags: [String] { get } // structured labels or keywords that describe the enry
}
