#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"

  echo $($PSQL "TRUNCATE teams, games;")

  cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
  do
    if [[ $YEAR != year ]]
    then
      # get team_id from winners
      TEAM_ID_WIN=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")
      # if not found
      if [[ -z $TEAM_ID_WIN ]]
      then
        # insert team_name
        INSERT_TEAM_NAME=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER');")
        if [[ $INSERT_TEAM_NAME == "INSERT 0 1" ]]
        then
          echo "Inserted into teams, $WINNER"
        fi
        # get new team_id
        TEAM_ID_WIN=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")
      fi

      # get team_id from opponents
      TEAM_ID_OPP=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")
      # if not found
      if [[ -z $TEAM_ID_OPP ]]
      then
        # insert team_name
        INSERT_TEAM_NAME=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT');")
        if [[ $INSERT_TEAM_NAME == "INSERT 0 1" ]]
        then
          echo "Inserted into teams, $OPPONENT"
        fi
        # get new team_id
        TEAM_ID_OPP=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")
      fi    
      # get game_id
      GAME_ID=$($PSQL "SELECT game_id FROM games WHERE year=$YEAR AND round='$ROUND' AND winner_id=$TEAM_ID_WIN
      AND opponent_id=$TEAM_ID_OPP AND winner_goals=$WINNER_GOALS AND opponent_goals=$OPPONENT_GOALS;")
      # if not found
      if [[ -z $GAME_ID ]]
      then
        # insert new game_id
        INSERT_GAME=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals)
        VALUES($YEAR, '$ROUND', $TEAM_ID_WIN, $TEAM_ID_OPP, $WINNER_GOALS, $OPPONENT_GOALS);")
        if [[ $INSERT_GAME == "INSERT 0 1" ]]
        then
          echo "Inserted into games, $YEAR, $WINNER, $OPPONENT"
        fi
      fi
    fi
  done

fi

# Do not change code above this line. Use the PSQL variable above to query your database.

