
/*
We are given a table of IPL team names and asked to generate all possible matches (combinations) where each team plays against every other team exactly once.

This ensures that we avoid duplicate matches (like TeamA vs TeamB and TeamB vs TeamA) and get only unique combinations.

Self Join in SQL
Using  comparison on string columns
Avoiding duplicate combinations in self-join
Generating possible matches using SQL
*/

-- Task : Generate all possible combination of Matches.
CREATE TABLE ipl_team (
    team_name VARCHAR(10)
);

INSERT INTO ipl_team (team_name) VALUES
('MI'),
('CSK'),
('RCB'),
('KKR'),
('RR'),
('DC');

-- Input 
select * 
from ipl_team;

--Solution

with ipl_team_matches as (
select t1.team_name as team_1,
  	t2.team_name as team_2,
  t1.team_name || " vrs " || t2.team_name as matches
  from ipl_team t1 join ipl_team t2 on t1.team_name < t2.team_name
)
select *
from ipl_team_matches;