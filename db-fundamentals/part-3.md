Databases Fundamentals – Part 3
CRUD Operations in Action + Relational vs Non-Relational
Note by Tandap – Date: [around February 2026]
1. INSERT (Create) – Writing Data to the Database
Insert into users table (only specifying username and email — user_id auto-increments):
SQLINSERT INTO users (username, email)
VALUES 
    ('fluffy', 'fluffy@gmail.com'),
    ('paws', 'paws@gmail.com');

After running this, the first user gets user_id = 1, second gets user_id = 2 (auto-increment).

Insert into videos table (linking videos to users via user_id):
SQLINSERT INTO videos (user_id, title, link, upload_date)
VALUES 
    (1, 'cat skateboarding', 'www.youtube.com/cat-skate', '2026-02-16'),
    (2, 'fluffy jumps', 'www.youtube.com/fluffy-jump', '2026-02-17'),
    (1, 'another cat video', 'www.youtube.com/cat2', '2026-02-18');

user_id must exist in the users table (foreign key constraint enforces this).
Dates use YYYY-MM-DD format.

2. SELECT (Read) – Viewing Inserted Data
SQL-- View all rows and columns from videos table
SELECT * FROM videos;

-- Or from users
SELECT * FROM users;
This shows everything you just inserted.
3. UPDATE – Modifying Existing Data
SQLUPDATE videos
SET title = 'Fluffy on Skateboard'
WHERE video_id = 1;

Always use a WHERE clause to avoid updating every row!
Here we change the title of the video with video_id = 1.

4. DELETE – Removing Data
SQLDELETE FROM videos
WHERE video_id = 3;

Again, use WHERE to target specific rows.
Thanks to ON DELETE CASCADE in the foreign key (from earlier notes), deleting a user would also delete their videos automatically.

After delete, run SELECT * FROM videos; to see the updated table.
Quick CRUD Summary (Create, Read, Update, Delete)

Create → INSERT INTO ... VALUES ...
Read   → SELECT ... FROM ...
Update → UPDATE ... SET ... WHERE ...
Delete → DELETE FROM ... WHERE ...

These are the four core operations you use daily in SQL.
```mermaid
graph TD
    subgraph Relational (SQL)
        direction LR
        A[Users]
        B[Orders]
        A -- one-to-many --> B
    end
    subgraph Non-Relational (NoSQL)
        direction LR
        C[User Document]
        D["{<br>  username: 'fluffy',<br>  orders: [<br>    { order_id: 1, ... },<br>    { order_id: 2, ... }<br>  ]<br>}"]
        C --- D
    end
```

5. Relational vs Non-Relational Databases
Relational Databases (SQL databases like MySQL, PostgreSQL, SQLite):

Data stored in tables with rows & columns
Fixed schema (structure defined in advance)
Use SQL for queries
Strong relationships via primary/foreign keys
Great for structured data, transactions (e.g., banking, e-commerce)
Enforce integrity (e.g., no invalid foreign keys)

Non-Relational Databases (NoSQL – Not Only SQL):

Flexible schema (no fixed structure)
Common types:
Document stores (e.g., MongoDB) → store JSON-like documents
Key-value stores (e.g., Redis) → simple key → value pairs
Graph databases (e.g., Neo4j) → nodes & relationships
Wide-column (e.g., Cassandra) → for big data
Time-series, search engines, etc.

Better for unstructured/semi-structured data, scalability, speed in certain cases (e.g., social media feeds, big data)
Often no joins — data is denormalized or nested

Comparison visual (tables vs flexible documents/graphs):
icepanel.medium.commedium.comnebula-graph.io


Your mratube example is a classic relational setup — perfect for learning structured data and relationships.
You're making excellent progress with hands-on SQL! Next you could try:

SELECT with JOIN to combine users + videos
WHERE, ORDER BY, LIMIT for filtering/sorting
More inserts and see how cascade delete works