import Foundation
import SwiftUI
import Combine //declarative Swift API??

//class declaration & actor isolation
@MainActor
final class MoodStore: ObservableObject {
    @Published private(set) var entries: [MoodEntry] = []
    
    // You can change the filename if you want
    private let filename = "mood_history.json"
    
    private var fileURL: URL {
        let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return dir.appendingPathComponent(filename)
    }
    
    //encode Swift --> JSON data
    private let encoder: JSONEncoder = {
        let enc = JSONEncoder()
        enc.outputFormatting = [.prettyPrinted, .withoutEscapingSlashes]
        enc.dateEncodingStrategy = .iso8601
        return enc
    }()
    
    private let decoder: JSONDecoder = {
        let dec = JSONDecoder()
        dec.dateDecodingStrategy = .iso8601
        return dec
    }()
    
    init() {
        load()
    }
    
    func add(emotionLabel: String) {
        let newEntry = MoodEntry(emotionLabel: emotionLabel)
        entries.append(newEntry)
        // Keep newest first (optional)
        entries.sort { $0.date > $1.date }
        save()
    }
    
    func remove(at offsets: IndexSet) {
        entries.remove(atOffsets: offsets)
        save()
    }
    
    func clearAll() {
        entries.removeAll()
        save()
    }
    
    private func save() {
        do {
            let data = try encoder.encode(entries)
            try data.write(to: fileURL, options: [.atomic, .completeFileProtection])
            // print("Saved to \(fileURL)")
        } catch {
            print("❌ Save failed: \(error)")
        }
    }
    
    private func load() {
        do {
            let data = try Data(contentsOf: fileURL)
            entries = try decoder.decode([MoodEntry].self, from: data)
            // Keep newest first (optional)
            entries.sort { $0.date > $1.date }
        } catch {
            // First run: file won’t exist yet—this is fine
            entries = []
        }
    }
}
