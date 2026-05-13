--Solving some bussiness problems on this netflix dataset.
select * from netflix ;


--Que-1.Year-over-Year (YoY)

with yearly_counts as (
select 
      extract (year from to_date(trim(date_added), 'Month DD, YYYY')) as year_added,
	  count(*) as total_tv_shows
	  from netflix
	  where type='TV Show' and date_added is not null
	  group by 1
)
select year_added ,
       total_tv_shows,
	   lag(total_tv_shows)over(order by year_added) as previous_year_shows,
	   round(
             ((total_tv_shows-lag(total_tv_shows)over(order by year_added))::numeric /
			 lag(total_tv_shows)over(order by year_added))*100,2
	   ) as yoy_growth
from yearly_counts;

--Que-2. Highest rating among TV show and movies

select type,rating 
from
(select 
       type,rating,count(*),
	   rank() over(partition by type order by count(*) desc) as ranking
from netflix
group by 1,2) as subquery
where ranking = 1;

--Que-3. Select movies released in 2019

select * from netflix where type = 'Movie' and release_year=2019;

--Que-4.Top 3 countries with most content on netflix

select 
      unnest(string_to_array(country,',')) as new_country,
	  count(show_id) as total_content
from netflix
group by 1
order by 2 desc
limit 3;

--Que-5. Longest movie

SELECT * FROM netflix
WHERE type = 'Movie'
and
duration is not null
ORDER BY SPLIT_PART(duration, ' ', 1)::INT DESC
limit 1;

--Que-6.Content added in last 10 years

select title,type,
to_date(trim(date_added),'Month DD,YYYY') as new_date
from netflix
where date_added is not null
and
to_date(trim(date_added),'Month DD,YYYY')>= current_date - interval'5 years'
order by new_date ;

--Que-7.All movies that are documentaries

select * from netflix 
where listed_in = 'Documentaries';

--Que-8.Find each year and the average numbers of content release in India on netflix. return top 5 year with highest avg content release!

select release_year,count(show_id) as india_content,
       round(
	   (count(show_id)::numeric)/
	   (select count(*) from netflix where release_year=s.release_year)::numeric*100,
	   2) as avg_content_share
	   from (
             select show_id,release_year, unnest(string_to_array(country,',')) as country from netflix
	   ) as s
	   where country='India'
	   group by release_year
	   order by avg_content_share desc
	   limit 5;

--Que-9. Director-Actor pairs who have collaborated on the most projects.

select d.directors,a.actors ,count(*) as total_colab from (
select show_id,trim(unnest(string_to_array(director,','))) as directors,casts from netflix
where director is not null
) as d
cross join lateral (
select show_id,trim(unnest(string_to_array(casts,','))) as actors
from (select d.casts) as c
) as a
where a.actors is not null
group by 1,2
order by total_colab desc
limit 10;


      

	   
      