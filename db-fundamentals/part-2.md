Databases Fundamentals – Part 2
Creating RDBMS Structures (Relational Database Management Systems)
CRUD Operations (Create, Read, Update, Delete)
Note by Tandap – Date: [around February 2026]
1. Database Creation & Selection Commands (MySQL)
SQL-- Create a new database
CREATE DATABASE mratube;

-- View all databases
SHOW DATABASES;

-- Switch to (use) the new database
USE mratube;

-- See which database is currently selected
SELECT DATABASE();
2. Creating Tables with Primary Keys & Auto-Increment
users table (stores user information):
SQLCREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL
);
videos table (stores video information, linked to users):
SQLCREATE TABLE videos (
    video_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    title VARCHAR(255) NOT NULL,
    link VARCHAR(500),
    upload_date DATE,
    
    -- Define the foreign key relationship
    FOREIGN KEY (user_id) REFERENCES users(user_id)
        ON DELETE CASCADE
);

user_id in videos is a foreign key that references the user_id (primary key) in the users table.
ON DELETE CASCADE → If a user is deleted from the users table, all their videos are automatically deleted from the videos table (prevents "orphaned" records).

This is a classic one-to-many relationship:

One user → can upload many videos
Each video → belongs to one user

3. Viewing Table Structure
SQL-- Show the structure (columns, types, keys) of a table
DESCRIBE users;
DESCRIBE videos;
(or use SHOW CREATE TABLE videos; for the full creation script including keys)
Quick Summary of Key Concepts Here

AUTO_INCREMENT: Automatically generates unique IDs (1, 2, 3...) when you insert new rows without specifying the ID.
NOT NULL: This column must always have a value — cannot be empty.
VARCHAR(n): Variable-length text string (max length n characters).
INT: Whole number.
DATE: Stores dates (e.g., '2026-02-16').
FOREIGN KEY ... REFERENCES: Enforces the link between tables.
ON DELETE CASCADE: Automatic cleanup when parent record is deleted.

Visual: One-to-Many Relationship (Crow's Foot Notation)
This is exactly the relationship you created (users → videos):
```mermaid
erDiagram
    users ||--o{ videos : "has"
    users {
        int user_id PK
        varchar(100) username
        varchar(255) email
    }
    videos {
        int video_id PK
        int user_id FK
        varchar(255) title
        varchar(500) link
        date upload_date
    }
```



The side with || or  near the users table = "one" (mandatory or exactly one).
The side with > or >o near the videos table = "many" (zero or many / one or many).

Your example uses a common pattern: one user → many videos (with optional participation from the video side).
You're doing really well building practical examples — this is a solid foundation for a simple video-sharing app database like "mratube"!
Next steps you might want to explore:

INSERT some sample data
SELECT queries with JOINs
UPDATE and DELETE examples