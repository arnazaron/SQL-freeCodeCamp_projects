#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"

echo -e "\nTotal number of goals in all games from both teams combined:"
echo "$($PSQL "SELECT SUM(winner_goals) + SUM(opponent_goals) AS total_goals FROM games;")"

echo -e "\nAverage number of goals in all games from the winning teams:"
echo "$($PSQL "SELECT AVG(winner_goals) from games;")"

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo "$($PSQL "SELECT ROUND(AVG(winner_goals), 2) FROM games;")"

echo -e "\nAverage number of goals in all games from both teams:"
echo "$($PSQL "SELECT ROUND(AVG(games.total_avg), 16) FROM (SELECT AVG(winner_goals) + AVG(opponent_goals) AS total_avg FROM games) AS games;")"

echo -e "\nMost goals scored in a single game by one team:"
echo "$($PSQL "SELECT MAX(winner_goals) from games;")"

echo -e "\nNumber of games where the winning team scored more than two goals:"
echo "$($PSQL "SELECT COUNT(winner_goals) from games WHERE winner_goals > 2;")"

echo -e "\nWinner of the 2018 tournament team name:"
echo "$($PSQL "SELECT name FROM teams FULL JOIN games ON teams.team_id = games.winner_id WHERE games.round = 'Final' AND games.year = 2018;")"

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo "$($PSQL "SELECT name FROM teams, games WHERE (teams.team_id = games.winner_id OR teams.team_id = games.opponent_id) AND games.year = 2014 AND games.round = 'Eighth-Final' ORDER BY name;")"

echo -e "\nList of unique winning team names in the whole data set:"
echo "$($PSQL "SELECT DISTINCT(name) FROM teams, games WHERE teams.team_id = games.winner_id ORDER BY name;")"

echo -e "\nYear and team name of all the champions:"
echo "$($PSQL "SELECT year, name FROM teams, games WHERE round = 'Final' AND games.winner_id = teams.team_id ORDER BY name DESC;")"

echo -e "\nList of teams that start with 'Co':"
echo "$($PSQL "SELECT name FROM teams WHERE teams.name LIKE 'Co%' ORDER BY name;")"