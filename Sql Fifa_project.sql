create database Fifa_project;
use Fifa_project;
select * from fifa;
select * from fifa limit 5;

# How many players are there?
Select count(*) as total_player
from fifa;#16643

# How many nationalities?
select count(Distinct Nationality) as total_nationalities
from fifa;#161

# What is the total wage given to all players? What's the average and standard deviation?
select sum(wage),#160073000
avg(wage),#9618.0376
stddev(wage) from fifa;#22262.850062074485

# Which nationality has the highest number of players, what are the top 3 nationalities by # of players?
select nationality,
count(*) as players
from fifa
group by nationality
order by players desc
limit 3;

# Which player has the highest wage? Who has the lowest?
select name,id,wage from fifa
where wage=(select max(wage) from fifa);

select id,name,wage from fifa
where wage=(select min(wage) from fifa);

# The player having the – best overall rating? Worst overall rating?
select id,name,overall from fifa
where overall=(select max(overall) from fifa)
union
select id,name,overall from fifa
where overall=(select min(overall) from fifa);

# Club having the highest total of overall rating? Highest Average of overall rating?
select club,sum(overall) as total_overall
from fifa
group by club
order by total_overall DESC
LIMIT 1;#2585

select club,avg(overall) as avg_overall
from fifa
group by club
order by avg_overall DESC
LIMIT 1;

# What are the top 5 clubs based on the average ratings of their players and their corresponding averages?
select club,avg(overall) as avg_overall
from fifa
group by club
order by avg_overall DESC
LIMIT 5;

select club,avg(overall) as avg_overall,avg(Potential) as avg_potential
from fifa
group by club
order by avg_overall limit 5;

# What is the distribution of players whose preferred foot is left vs right?
SELECT Preferred_Foot,
COUNT(*) AS Players
FROM fifa
GROUP BY Preferred_Foot;

# Which jersey number is the luckiest?
select jersey_number,
count(*) as players
from fifa
group by jersey_number
order by players DESC
limit 1;

# What is the frequency distribution of nationalities among players whose club name starts with M?
select nationality,
count(*) as players
from fifa
where club like 'M%'
group by nationality
order by players;

# How many players have joined their respective clubs in the date range 20 May 2018 to 10 April 2019 (both inclusive)?
select count(*) as players
from fifa
where joined between 20-05-2018 and 10-04-2019;#0

# How many players have joined their respective clubs date wise?
select joined,
count(*) as players
from fifa
group by joined
order by players;

# How many players have joined their respective clubs yearly?
select year(joined) as year,
count(*) as players
from fifa
group by year(joined)
order by players;

