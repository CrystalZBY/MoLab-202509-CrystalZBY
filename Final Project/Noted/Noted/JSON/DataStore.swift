import SwiftUI
internal import Combine

final class DataStore: ObservableObject {
    @Published private(set) var model: Model
    private let fileName = "Model.json"

    init(model: Model = Model(JSONfileName: "Model.json")) {
        self.model = model
    }

    var moodEntries: [MoodEntry] { model.moodEntries }
    var sleepEntries: [SleepEntry] { model.sleepEntries }
    var foodEntries: [FoodEntry] { model.foodEntries }
    var movementEntries: [MovementEntry] { model.movementEntries }
    var nutritionEntries: [NutritionEntry] { model.nutritionEntries }
    var rhythmEntries: [DailyRhythmEntry] { model.rhythmEntries }

    // MARK: - Mood helpers used by UI
    func add(emotionLabel: String, feelings: [String], notes: String = "", tags: [String] = []) {
        let entry = MoodEntry(
            id: UUID(),
            date: Date(),
            emotionLabel: emotionLabel,
            feelings: feelings,
            notes: notes,
            tags: tags
        )
        model.add(entry)
        persist()
    }

    // MARK: - Generic pass-throughs as needed
    func update(_ entry: MoodEntry) { model.update(entry); persist() }
    func deleteMood(id: UUID) { model.deleteMood(id: id); persist() }

    // MARK: - Persistence
    private func persist() {
        model.saveAsJSON(fileName: fileName)
        // Publish change
        objectWillChange.send()
    }
}

// ObservableObject wrapper around Model for use with @EnvironmentObject
final class ModelObservable: ObservableObject {
    @Published var model: Model

    init(model: Model = Model(JSONfileName: "Model.json")) {
        self.model = model
    }
}
