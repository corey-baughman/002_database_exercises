-- 1. Use the albums_db database.
USE albums_db;

-- 2. What is the primary key for the albums table?
DESCRIBE albums;
-- Answer: Primary Key is the 'id' field.

-- 3. What does the column named 'name' represent?
SELECT * FROM albums
LIMIT 5;
-- Answer: The 'name' column is a required field that contains the album name.as

-- 4. What do you think the sales column represents?
-- Answer: I would guess the sales column represents the number of albums sold in millions.

-- 5. Find the name of all albums by Pink Floyd.
SELECT name FROM albums
	WHERE artist = 'Pink Floyd';
-- Answer: There are two Pink Floyd albums - Dark Side of the Moon and The Wall

-- 6. What is the year Sgt. Pepper's Lonely Hearts Club Band was released?
SELECT release_date FROM albums
WHERE name = "Sgt. Pepper's Lonely Hearts Club Band";
-- Answer: 1967

-- 7. What is the genre for the album Nevermind?
SELECT genre FROM albums
	WHERE name = 'Nevermind';
-- Answer: Grunge, Alternative rock

-- 8. Which albums were released in the 1990s?
SELECT name, release_date FROM albums
	WHERE release_date BETWEEN 1990 AND 1999;
-- Answer: There are 13 records in the list from the 1990s, run query to see list

-- 9. Which albums had less than 20 million certified sales? Rename this column as low_selling_albums.
SELECT name as low_selling_albums 
FROM albums
WHERE sales < 20;
	