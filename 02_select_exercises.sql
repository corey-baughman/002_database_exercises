use albums_db;
describe albums;
-- 3a. How many rows in albums? 31
-- 3b. How many unique artist names are in the albums table? 23
-- 3c. What is the primary key for the albums table? id
-- 3d. What is the oldest release date for any album in the albums table? 1967 Most recent? 2011
select * from albums;
select * from albums where release_date < 1969;
select * from albums order by release_date desc;
select distinct artist from albums;
-- 4a. names of all albums by Pink Floyd
select name from albums where artist = 'Pink Floyd';
-- 4b. year Sgt. Pepper's Lonely Hearts Club Band released
select release_date from albums where name = 'Sgt. Pepper\'s Lonely Hearts Club Band';
-- 4c. genre for the album Nevermind
select genre from albums where name = 'Nevermind';
-- 4d. albums released in the 1990s
select * from albums where release_date between 1990 and 1999 order by release_date asc;
-- 4e. albums with less than 20 million sales
select * from albums where sales < 20 order by sales desc;
-- 4f. albums in rock genre. Why do these query results not include "Hard rock" or Progressive rock?"
select * from albums where genre = 'Rock';
/* Hard rock and Prog rock not included, nor are cross-genre albums like Thriller because genre is 
set up as a single text field and we did not do a wild card search.