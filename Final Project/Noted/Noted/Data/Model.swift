//
//  Model.swift
//  Noted
//
//  Created by Crystal Zhang on 11/14/25.
//

// defines Model struct that stores and manages a list of items (ItemModel) --> data container or data manager
import Foundation

struct Model: Codable {
    var moodEntries: [MoodEntry] = []
    var sleepEntries: [SleepEntry] = []
    var foodEntries: [FoodEntry] = []
    var movementEntries: [MovementEntry] = []
    var nutritionEntries: [NutritionEntry] = []
    var rhythmEntries: [DailyRhythmEntry] = []

    // MARK: - Add
    mutating func add(_ entry: MoodEntry) { moodEntries.append(entry) }
    mutating func add(_ entry: SleepEntry) { sleepEntries.append(entry) }
    mutating func add(_ entry: FoodEntry) { foodEntries.append(entry) }
    mutating func add(_ entry: MovementEntry) { movementEntries.append(entry) }
    mutating func add(_ entry: NutritionEntry) { nutritionEntries.append(entry) }
    mutating func add(_ entry: DailyRhythmEntry) { rhythmEntries.append(entry) }

    // MARK: - Update
    mutating func update(_ entry: MoodEntry) {
        if let i = moodEntries.firstIndex(where: { $0.id == entry.id }) {
            moodEntries[i] = entry
        }
    }
    mutating func update(_ entry: SleepEntry) {
        if let i = sleepEntries.firstIndex(where: { $0.id == entry.id }) {
            sleepEntries[i] = entry
        }
    }
    mutating func update(_ entry: FoodEntry) {
        if let i = foodEntries.firstIndex(where: { $0.id == entry.id }) {
            foodEntries[i] = entry
        }
    }
    mutating func update(_ entry: MovementEntry) {
        if let i = movementEntries.firstIndex(where: { $0.id == entry.id }) {
            movementEntries[i] = entry
        }
    }
    mutating func update(_ entry: NutritionEntry) {
        if let i = nutritionEntries.firstIndex(where: { $0.id == entry.id }) {
            nutritionEntries[i] = entry
        }
    }
    mutating func update(_ entry: DailyRhythmEntry) {
        if let i = rhythmEntries.firstIndex(where: { $0.id == entry.id }) {
            rhythmEntries[i] = entry
        }
    }

    // MARK: - Delete
    mutating func deleteMood(id: UUID) { moodEntries.removeAll { $0.id == id } }
    mutating func deleteSleep(id: UUID) { sleepEntries.removeAll { $0.id == id } }
    mutating func deleteFood(id: UUID) { foodEntries.removeAll { $0.id == id } }
    mutating func deleteMovement(id: UUID) { movementEntries.removeAll { $0.id == id } }
    mutating func deleteNutrition(id: UUID) { nutritionEntries.removeAll { $0.id == id } }
    mutating func deleteRhythm(id: UUID) { rhythmEntries.removeAll { $0.id == id } }
}
