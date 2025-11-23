//
//  ItemModel.swift
//  Noted
//
//  Created by Crystal Zhang on 11/14/25.
//

//define model to encode/decode
//encoding: converting a Swift type (struct) --> a data format (JSON); ex. MoodEntry → { "emotionLabel": "Happy", "date": "2025-11-04T10:00:00Z" }
//decoding: converting data --> back to Swift; ex. { "emotionLabel": "Happy" } → MoodEntry(emotionLabel: "Happy")


import Foundation

//identifiable: an id, instances hold the value of an entity with stable identity
//codable: it can be saved/loaded as JSON
//hashable: allow Swift to generate a numeric identity for fast lookups and comparisons --> I can compare it, store in sets, use it in ForEach
//
//struct MoodEntry: Identifiable, Codable, Hashable {
//    let id: UUID
//    let emotionLabel: String
//    let feelings: [String]
//    let date: Date
//    
//    // overriding Swift's automatically generataed initializer
//    init(
//            id: UUID = UUID(),
//            emotionLabel: String,
//            feelings: [String],
//            date: Date = Date()
//        ) {
//            self.id = id
//            self.emotionLabel = emotionLabel
//            self.feelings = feelings
//            self.date = date
//        }
//}

struct MoodEntry: LogEntry{
    let id: UUID
    let date: Date
    let emotionLabel: String
    let feelings: [String]
    let notes: String
    let tags: [String]
}

// SleepEntry is a type of LogEntry, and it must follow all the rules of LogEntry
// without init () --> default values are assigned at the property level instaed of inside an initializer
struct SleepEntry: LogEntry {
    let id: UUID
    let date: Date
    let durationHours: Double
    let notes: String
    let tags: [String]
}

struct FoodEntry: LogEntry {
    let id: UUID
    let date: Date
    let meal: String       // breakfast / lunch / snack
    let items: [String]    // "eggs", "banana"
    let notes: String
    let tags: [String]
}

struct MovementEntry: LogEntry {
    let id: UUID
    let date: Date
    let activityType: String   // yoga / stretching / walking
    let durationMinutes: Int
    let intensity: String      // easy / moderate / hard
    let notes: String
    let tags: [String]
}
    
struct NutritionEntry: LogEntry {
    let id: UUID
    let date: Date
    let hydrationML: Int?
    let caffeineMG: Int?
    let calories: Int?
    let notes: String
    let tags: [String]
}

struct DailyRhythmEntry: LogEntry {
    let id: UUID
    let date: Date
    let wakeTime: Date?
    let sleepPrepTime: Date?
    let notes: String
    let tags: [String]
}

