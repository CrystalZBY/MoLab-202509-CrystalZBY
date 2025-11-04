//define model to encode/decode
//encoding: converting a Swift type (struct) --> a data format (JSON); ex. MoodEntry → { "emotionLabel": "Happy", "date": "2025-11-04T10:00:00Z" }
//decoding: converting data --> back to Swift; ex. { "emotionLabel": "Happy" } → MoodEntry(emotionLabel: "Happy")


import Foundation

//identifiable: instances hold the value of an entity with stable identity
//codable: encode & decode json data
//hashable: allow Swift to generate a numeric identity for fast lookups and comparisons
struct MoodEntry: Identifiable, Codable, Hashable {
    let id: UUID
    let emotionLabel: String
    let date: Date
    
    init(id: UUID = UUID(), emotionLabel: String, date: Date = Date()) {
        self.id = id
        self.emotionLabel = emotionLabel
        self.date = date
    }
}
