import SQLiteVec

func runVectorDBExample() async throws {
    // initialize the library first
    try SQLiteVec.initialize()

    // example data
    let data: [(index: Int, vector: [Float])] = [
        (1, [0.1, 0.1, 0.1, 0.1]),
        (2, [0.2, 0.2, 0.2, 0.2]),
        (3, [0.3, 0.3, 0.3, 0.3]),
        (4, [0.4, 0.4, 0.4, 0.4]),
        (5, [0.5, 0.5, 0.5, 0.5]),
    ]
    let query: [Float] = [0.3, 0.3, 0.3, 0.3]

    // create a database
    let db = try Database(.inMemory)

    // create a table and insert data
    try await db.execute("CREATE VIRTUAL TABLE vec_items USING vec0(embedding float[4])")
    for row in data {
        try await db.execute(
            """
            INSERT INTO vec_items(rowid, embedding)
            VALUES (?, ?)
            """,
            params: [row.index, row.vector]
        )
    }

    // query the embeddings
    let result = try await db.query(
        """
        SELECT rowid, distance
        FROM vec_items
        WHERE embedding MATCH ?
        ORDER BY distance
        LIMIT 3
        """,
        params: [query]
    )

    // print the result
    print(result)
}
