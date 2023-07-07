#!/bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Truncate table of existing data
TRUNCATE_TABLES=$($PSQL 'TRUNCATE TABLE games, teams;')
if [[ $TRUNCATE_TABLES == "TRUNCATE TABLE" ]]
then
  echo $TRUNCATE_TABLES
fi
COUNTER=0

# insert teams
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do

  if [[ $COUNTER -eq 0 ]]
  then
    # burn a cycle to skip the first line
    COUNTER=$(($COUNTER+1))
  else
    # Get or insert team
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")
    # if team does not exist
    if [[ -z $WINNER_ID ]]
    then
      # Insert team
      INSERT_WINNER_RESULT=$($PSQL "INSERT INTO teams (name) VALUES ('$WINNER');")
      # check that team was inserted
      if [[ $INSERT_WINNER_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted team $WINNER"
      fi
    fi
    # Get or insert opp
    OPP_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")
    # if team does not exist
    if [[ -z $OPP_ID ]]
    then
      # insert team
      INSERT_OPP_RESULT=$($PSQL "INSERT INTO teams (name) VALUES ('$OPPONENT');")
      # check that team was inserted
      if [[ $INSERT_OPP_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted opp $OPPONENT"
      fi
    fi  

  fi

done

# Reset counter to 0 for next loop
COUNTER=0
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $COUNTER -eq 0 ]]
  then
    # burn a cycle to skip the first line
    COUNTER=$(($COUNTER+1))
  else
    #Get winner and opp id
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")
    OPP_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")
    # insert row int(o games
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games 
    (year, round, winner_id, opponent_id, winner_goals, opponent_goals)
    VALUES
    ($YEAR, '$ROUND', $WINNER_ID, $OPP_ID, $WINNER_GOALS, $OPPONENT_GOALS);")
    if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
    then
      echo "Game added successfully"
    else
      echo "Game failed to insert"
    fi
  fi
done