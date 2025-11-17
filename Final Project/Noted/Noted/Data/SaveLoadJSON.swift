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
    // reads the file contents into a String, converts the string back into UTF-8 data (Unicode Transformation Format; 8 = uses 8-bit chunks (1 byte))
    guard let jsonData = jsonString.data(using: .utf8) else { throw FileError.missing }
    
    //decode JSON --> Swfit type
    let decoder = JSONDecoder()
    return try decoder.decode(type, from: jsonData)
}

// custom error thrown when the file doesn't exist
enum FileError: Error {
    case missing
}

// Remove a file from the documents directory --> delete a JSON file
// fileName - the name of the file to remove

func remove(fileName: String) {
    do {
        let filePath = try documentPath(fileName: fileName);
        try FileManager.default.removeItem(at: filePath)
    } catch {
        // fatalError("Model init error \(error)")
        print("remove fileName error \(error)")
    }
}

// Return the path the a file in the user documents directory
// Retrives the app's Documents directly
// fileName - name of file

func documentPath(fileName: String, create: Bool = false) throws -> URL {
    let directory = try FileManager.default.url(
        for: .documentDirectory,
        in: .userDomainMask,
        appropriateFor: nil,
        create: create)
    return directory.appendingPathComponent(fileName);
}
