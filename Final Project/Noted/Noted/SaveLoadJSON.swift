import Foundation

//T: generic placeholder type
func saveJSON<T: Encodable>(fileName: String, val: T) throws {
    // get the location to save the file
    let filePath = try documentPath(fileName: fileName);
    print("saveJSON filePath \(filePath as Any)")
    
    // create a JSON encoder; .prettyPrinted: json will look nive with line breaks and indentation --> more readable
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    
    //encode Swift value into JSON data; convert val --> raw JSON bytes
    let jsonData = try encoder.encode(val)
    print("Model saveAsJSON jsonData \(String(describing: jsonData))")
    
    //convert JSON data (bytes) to human-readable UTF-8 string
    let str = String(data: jsonData, encoding: .utf8)!
     print("Model saveAsJSON encode str \(str)")
    
    // Terminal command 'cp' to copy output file to Downloads folder
    // The trailing period means use the same file name as the source
    print("Model saveAsJSON encode str \(filePath as Any)")
    print("cp \(filePath.absoluteString.dropFirst(7)) ~/Downloads/." )

    // write the JSON string to disk
    // atomically: true --> write to a temporary file first then replaces the existing one safely
    try str.write(to: filePath, atomically: true, encoding: .utf8)
}


// Read a value stored as JSON from a file in the documents directory
//  fileName - name of file to read
//  returns the value converted from JSON

func loadJSON<T :Decodable>(_ type: T.Type, fileName: String) throws -> T {
    let filePath = try documentPath(fileName: fileName);
    let filePathExists = FileManager.default.fileExists(atPath: filePath.path)
    if !filePathExists {
        print("loadJSON NO file at filePath \(filePath as Any)")
        throw FileError.missing;
    }
    print("loadJSON filePath \(filePath as Any)")
    
    let jsonString = try String(contentsOfFile: filePath.path, encoding: .utf8)
    // reads the file contents into a String, converts the string back into UTF-8 data
    // UTF = Unicode Transformation Format; 8 = uses 8-bit chunks (1 byte)
    guard let jsonData = jsonString.data(using: .utf8) else { throw FileError.missing }
    
    let decoder = JSONDecoder()
    return try decoder.decode(type, from: jsonData)
}

enum FileError: Error {
    case missing
}

func documentPath(fileName: String, create: Bool = false) throws -> URL {
    let directory = try FileManager.default.url(
        for: .documentDirectory,
        in: .userDomainMask,
        appropriateFor: nil,
        create: create)
    return directory.appendingPathComponent(fileName);
}


//MARK: Swift CoPilot help json code

//import Foundation
//import SwiftUI
//import Combine //declarative Swift API??
//
////class declaration & actor isolation
//@MainActor
//final class MoodStore: ObservableObject {
//    // @Published → whenever entries changes, any view using it will re-render.
//    // private(set) → views can read entries, but only MoodStore can mutate it. This protects your state from accidental external writes.
//    @Published private(set) var entries: [MoodEntry] = []
//    
//    // Stores data in the app’s Documents directory (user-specific, backed up by iCloud unless excluded).
//    private let filename = "mood_history.json"
//    
//    private var fileURL: URL {
//            FileManager.default
//                .urls(for: .documentDirectory, in: .userDomainMask)
//                .first!
//                .appendingPathComponent(filename)
//        }
//
//    
//    //encode Swift --> JSON data
//    private let encoder: JSONEncoder = {
//        //create encoder, run once, use over again
//        let enc = JSONEncoder()
//        enc.outputFormatting = [.prettyPrinted, .withoutEscapingSlashes]
//        enc.dateEncodingStrategy = .iso8601
//        return enc
//    }()
//    
//    private let decoder: JSONDecoder = {
//        let dec = JSONDecoder()
//        dec.dateDecodingStrategy = .iso8601
//        return dec
//    }()
//    
//    init() {
//        load()
//    }
//    
//    func add(emotionLabel: String, feelings: [String]) {
//        let entry = MoodEntry(emotionLabel: emotionLabel, feelings: feelings)
//            entries.append(entry)
//            entries.sort { $0.date > $1.date }
//            save()
//    }
//    
//    func remove(at offsets: IndexSet) {
//        entries.remove(atOffsets: offsets)
//        save()
//    }
//    
//    func clearAll() {
//        entries.removeAll()
//        save()
//    }
//    
//    private func save() {
//        do {
//            let data = try encoder.encode(entries)
//            try data.write(to: fileURL, options: [.atomic, .completeFileProtection])
//            // print("Saved to \(fileURL)")
//        } catch {
//            print("❌ Save failed: \(error)")
//        }
//    }
//    
//    private func load() {
//        do {
//            let data = try Data(contentsOf: fileURL)
//            print("Load data: \(data)")
//            let dataString = try String(contentsOf: fileURL, encoding: .utf8)
//            print("Load dataString: \(dataString)")
//            entries = try decoder.decode([MoodEntry].self, from: data)
//            // Keep newest first (optional)
//            entries.sort { $0.date > $1.date }
//        } catch {
//            // First run: file won’t exist yet—this is fine
//            entries = []
//        }
//    }
//}




