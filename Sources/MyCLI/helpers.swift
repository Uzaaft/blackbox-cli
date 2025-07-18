// helpers.swift

import Foundation
import SQLite3

func storeNoteToDatabase(note: String, source: String) {
    let dbPath = "notes.sqlite"
    var db: OpaquePointer?

    if sqlite3_open(dbPath, &db) != SQLITE_OK {
        print("Unable to open database.")
        exit(1)
    }

    let createTableQuery = """
            CREATE TABLE IF NOT EXISTS Notes (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                content TEXT NOT NULL,
                source TEXT,
                created_at DATETIME DEFAULT CURRENT_TIMESTAMP
            );
        """

    if sqlite3_exec(db, createTableQuery, nil, nil, nil) != SQLITE_OK {
        print("Could not create table.")
        sqlite3_close(db)
        exit(1)
    }

    var stmt: OpaquePointer?
    let insertQuery = "INSERT INTO Notes (content, source) VALUES (?, ?);"

    if sqlite3_prepare_v2(db, insertQuery, -1, &stmt, nil) == SQLITE_OK {
        sqlite3_bind_text(stmt, 1, note, -1, nil)
        sqlite3_bind_text(stmt, 2, source, -1, nil)

        if sqlite3_step(stmt) == SQLITE_DONE {
            print("Note stored successfully.")
        } else {
            print("Failed to insert note.")
        }
    } else {
        print("Failed to prepare statement.")
    }

    sqlite3_finalize(stmt)
    sqlite3_close(db)
}
