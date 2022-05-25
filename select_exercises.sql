use albums_db;

# 3
show tables;

select * from albums;

# a. how many rows are in the albums table?
-- 31 rows

# b. how many unique artist names are in the albums table?
select count(distinct(artist)) from albums;
-- 23 unique names

#3c. what is the primary key for albums table?
# primary key = Id

# 3d. 
select min(release_date) from albums; -- 1967
select max(release_date) from albums; -- 2011

# 4
select * from albums;

# a. name of all albums by Pink Floyd
select name from albums
where artist = 'Pink Floyd';
-- The Dark Side of the Moon
-- The Wall

# b. the year SPLHCBand was released:
select release_date from albums
where name = "Sgt. Pepper's Lonely Hearts Club Band";
-- 1967

# c. the genre for the album Nevermind
select genre from albums
where name = 'Nevermind';
-- Grunge, Alt rock

# d. which albums were released in the 1990s
select name, release_date from albums
where release_date between 1990 and 1999;
-- ^see resulting table

# e. which albums had less than 20 mil certified sales
select distinct(name), sales from albums
where sales < 20;
-- ^see resulting table

# f. all albums with a genre of "rock"
select distinct(name), genre from albums
where genre = 'rock';
# these query results don't include albums with genres of 'hard rock' or 'progressive rock'
# b/c we identify "genre '=' rock" not "genre 'like' '%rock%'"
# ...
# example of that:
select distinct(name), genre from albums
where genre like '%rock%';


