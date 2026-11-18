use project_movie_database;

-- Show Tables
show tables;

-- To merge this both tables  
SELECT
    m.Title,
    d.Name
FROM movies AS m
JOIN directors AS d
    ON m.Director_ID = d.ID;
    
-- a)	Can you get all data about movies? 
select * from movies;
 
-- b)	How do you get all data about directors? 
select * from directors;	

-- c)	Check how many movies are present in IMDB.
select count(*) from movies;

-- d)	Find these 3 directors: James Cameron ; Luc Besson ; John Woo
Select * from  directors 
where Name in ('James Cameron', 'Luc Besson' , 'John Woo');

-- e)	Find all directors with name starting with S.
select * from directors  where Name like 'S%';

-- f)	Count female directors.
select count(*) as Female_directors 
from directors where Gender=1;

-- g)	Find the name of the 10th first women directors?
select * from directors where Gender=1 
order by name limit 10;

-- h)	What are the 3 most popular movies?
Select * from movies 
order by popularity desc limit 3;

-- i)	What are the 3 most bankable movies?
Select Title,Revenue from movies
 order by Revenue desc limit 3;
 
 -- j)	What is the most awarded average vote since the January 1st, 2000?
 select Title, Release_Date, Vote_Average 
 from movies where Release_Date >= '2000-1-1' 
 order by Vote_Average desc limit 5;
 
-- k)	Which movie(s) were directed by Brenda Chapman?
select d.id,d.name, COUNT(m.id) as Total_Movies
from directors as d left join movies as m
on d.id = m.director_id
where d.name = 'Brenda Chapman'group by d.id, d.name;
 
 -- l)	Which director made the most movies?
 select d.Name, count(m.id) as Total_Movies 
 from directors as d join movies as m
 on d.id = m.director_id
 group by d.id, d. name order by Total_Movies desc limit 1;
 
 -- m)	Which director is the most bankable?
 select d.Name,sum(m.revenue) as Total_Revenue from directors as d 
 join movies as m 
 on d.id = m.director_id
 group by d.id, d.name
 order by Total_Revenue desc limit 1;