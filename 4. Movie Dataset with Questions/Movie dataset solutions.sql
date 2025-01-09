create database movie;
use movie;

-- Write a SQL query to find when the movie 'American Beauty' released. Return movie release year
select mov_year from movie
where mov_title = "American Beauty";

-- Write a SQL query to find those movies, which were released before 1998. Return  movie title.
select mov_title , mov_year from movie
where mov_year < 1998 ;

-- Write a query where it should contain all the data of the movies which were released after 1995 and their movie duration was greater than 120
select * from movie 
where mov_year > 1995 and mov_time > 120 ; 

-- Write a query to determine the Top 7 movies which were released in United Kingdom. Sort the data in ascending order of the movie year.
select mov_title, mov_rel_country from movie
where mov_rel_country = "UK"
order by mov_year asc
limit 7 ;

-- Set the language of movie language as 'Chinese' for the movie which has its existing language as Japanese and the movie year was 2001.
SET sql_safe_updates = 0;

update movie
set mov_lang = "Chinese"
where mov_lang = "Japanese" and mov_year = 2001;
select* from movie;

-- Write a SQL query to find name of all the reviewers who rated the movie 'Slumdog Millionaire
select r.rev_name from reviewer r
join ratings rt 
on r.rev_id = rt.rev_id
join movie m
on m.mov_id = rt.mov_id 
where m.mov_title = "Slumdog Millionaire";

-- Write a query which fetch the first name, last name & role played by the actor where output should all exclude Male actors
select a.act_fname,a.act_lname , c.role from actor a
 join cast c
on a.act_id = c.act_id 
where a.act_gender = "F";

-- Write a SQL query to find the actors who played a role in the movie 'Annie Hall'.Fetch all the fields of actor table. (Hint: Use the IN operator)
select a.* from actor a
join cast c 
on a.act_id = c.act_id
join movie m
on m.mov_id = c.mov_id 
where m.mov_title = "Annie Hall";

-- Write a SQL query to find those movies that have been released in countries other than the United Kingdom. 
-- Return movie title, movie year, movie time, and date of release, releasing country.
select mov_title,mov_year,mov_time,mov_dt_rel,mov_rel_country
from movie
where mov_rel_country not in ("UK");

-- Print genre title, maximum movie duration and the count the number of 
-- movies in each genre. (HINT: By using inner join)
select g.gen_title,max(m.mov_time) as max_time, count(m.mov_id) as count from genres g
join movie_genres mg
on g.gen_id = mg.gen_id 
join movie m
on m.mov_id = mg.mov_id
group by g.gen_title ; 

-- Create a view which should contain the first name, last name, title of the movie & role played by particular actor.
CREATE VIEW actor_movie_roles AS
SELECT a.act_fname,a.act_lname,m.mov_title,c.role
FROM actor a
JOIN cast c ON a.act_id = c.act_id
JOIN movie m ON m.mov_id = c.mov_id;

select * from actor_movie_roles;

-- xii. Write a SQL query to find the movies with the lowest ratings
select m.mov_title,r.rev_stars from movie m 
join ratings r 
on m.mov_id = r.mov_id 
order by r.rev_stars asc
limit 1 ;

