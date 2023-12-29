#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi


# Do not change code above this line. Use the PSQL variable above to query your database.


echo $($PSQL "TRUNCATE teams, games")
cat games.csv | while IFS="," read year round winner opponent winner_goals opponent_goals
do
  if [[ $year != 'year' ]]
  then
    winner_id=$($PSQL "SELECT team_id FROM teams WHERE name='$winner'")
    if [[ -z $winner_id ]]
    then
      insert_winner_result=$($PSQL "INSERT INTO teams(name) VALUES('$winner')")
      # if [[ $insert_winner_result == "INSERT 0 1" ]]
      # then
      #   echo "Inserted into teams, $winner"
      # fi
      winner_id=$($PSQL "SELECT team_id FROM teams WHERE name='$winner'")
    fi  

    opponent_id=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent'")
    if [[ -z $opponent_id ]]
    then
      insert_opponent_result=$($PSQL "INSERT INTO teams(name) VALUES('$opponent')")
      # if [[ $insert_opponent_result == "INSERT 0 1" ]]
      # then
      #   echo "Inserted into teams, $opponent"
      # fi
      opponent_id=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent'")
    fi  
    
    insert_game_result=$($PSQL "INSERT INTO 
    games(year,round,winner_id,opponent_id,opponent_goals, winner_goals)
    VALUES($year, '$round', $winner_id, $opponent_id, $opponent_goals, $winner_goals)")
  fi
done

