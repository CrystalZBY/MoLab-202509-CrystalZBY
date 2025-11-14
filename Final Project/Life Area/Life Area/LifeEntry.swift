//
//  Entries.swift
//  Life Area
//
//  Created by Crystal Zhang on 11/12/25.
//

//same as ItemModel

import Foundation

struct LifeEntry: Identifiable, Codable, Hashable {
    let id: UUID
    let lifeArea: String
    let subArea: String?
    let activities: [String]
    let notes: String
    let date: Date
}
