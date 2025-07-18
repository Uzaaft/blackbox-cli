import Foundation
import SQLite3

// MARK: - Main Logic

let args = CommandLine.arguments

guard args.count > 1 else {
    print("Usage: ./storeNote \"note text\" OR ./storeNote path/to/note.txt")
    exit(1)
}

let input = args[1]
var noteContent: String?
var source: String = "CLI"

if isTxtFile(input) {
    if let content = readTextFile(at: input) {
        noteContent = content
        source = URL(fileURLWithPath: input).lastPathComponent
    } else {
        print("Could not read .txt file.")
        exit(1)
    }
} else {
    noteContent = input
}

guard let note = noteContent else {
    print("No valid note content provided.")
    exit(1)
}

print(note)
