use albums_db;

#3
show tables;

select * from albums;

select count(distinct(artist)) from albums;

# primary key = Id

#4
select * from albums;

# name of all albums by Pink Floyd
select name from albums
where artist like '%Pink Floyd%';

# the year SPLHCBand was released:
select release_date from albums
where name = "Sgt. Pepper's Lonely Hearts Club Band";

# the genre for the album Nevermind
select genre from albums
where name = 'Nevermind';

# which albums were released in the 1990s
select distinct(name) from albums
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


