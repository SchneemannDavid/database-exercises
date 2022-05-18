use albums_db;

#3
show tables;

select * from albums;

# how many unique artist names are in the albums table?
select count(distinct(artist)) from albums;

#3c. what is the primary key for albums table?
# primary key = Id

#3d. 
select min(release_date) from albums;
select max(release_date) from albums;

#4
select * from albums;

# name of all albums by Pink Floyd
select name from albums
where artist = 'Pink Floyd';


# the year SPLHCBand was released:
select release_date from albums
where name = "Sgt. Pepper's Lonely Hearts Club Band";

# the genre for the album Nevermind
select genre from albums
where name = 'Nevermind';

# which albums were released in the 1990s
select name, release_date from albums
where release_date between 1990 and 1999;

# which albums had less than 20 mil certified sales
select distinct(name), sales from albums
where sales < 20;

# all albums with a genre of "rock"
select distinct(name), genre from albums
where genre = 'rock';
# these query results don't include albums with genres of 'hard rock' or 'progressive rock'
# b/c we identify "genre '=' rock" not "genre 'like' '%rock%'"
# ...
# example of that:
select distinct(name), genre from albums
where genre like '%rock%';


