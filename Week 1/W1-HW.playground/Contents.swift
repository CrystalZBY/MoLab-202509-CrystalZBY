import Foundation

let nature = "🌳🌿☘️🌱"

func charAt(_ str: String, _ offset: Int) -> String {
    let idx = str.index(str.startIndex, offsetBy: offset)
    return String(str[idx])
}

func randomChar() -> String {
    let r = Int.random(in: 0..<nature.count)
    return charAt(nature, r)
}

func generateBlock(size: Int) {
    for _ in 0..<size {
        var line = ""
        for _ in 0..<size {
            line += randomChar()
        }
        print(line)
    }
}

generateBlock(size: 10)
