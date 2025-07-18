// Check if path points to a .txt file
func isTxtFile(_ path: String) -> Bool {
    return path.lowercased().hasSuffix(".txt")
}

// Read text from file path
func readTextFile(at path: String) -> String? {
    do {
        return try String(contentsOfFile: path, encoding: .utf8)
    } catch {
        print("Failed to read file: \(error)")
        return nil
    }
}
