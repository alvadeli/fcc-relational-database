#!/bin/bash
NUMBER=$((1+$RANDOM%5))
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo -e "\n~~ Number guessing game ~~\n"
echo "Enter your username:"

# VALID_USERNAME=0
# while [[ $VALID_USERNAME = 0 ]]; do
read USERNAME
#   if [[ ${#USERNAME} -gt 22 ]]; then
#       echo "Too long - 22 characters max"
#       continue
#   fi
#   VALID_USERNAME=1
# done


PLAYER_INFO=$($PSQL "SELECT games_played,guesses_best_game FROM players 
WHERE name='$USERNAME'")

if [[ -z $PLAYER_INFO ]]; then
  INSERT_PLAYER_RESULT=$($PSQL "INSERT INTO players(name) VALUES('$USERNAME')")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  IFS='|' read -ra array <<< "$PLAYER_INFO"
  GAMES_PLAYED=${array[0]}
  GUESSES_BEST_GAMES=${array[1]}
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $GUESSES_BEST_GAMES guesses."
fi

echo "Guess the secret number between 1 and 1000:"

GUESS=-1
ATTEMPS=0
while ((GUESS != $NUMBER)); do
  ((ATTEMPS++))
  read GUESS  
  if [[ ! $GUESS =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi

  if [[ $GUESS -gt $NUMBER ]]; then 
    echo "It's lower than that, guess again:"
  elif [[ $GUESS -lt $NUMBER ]]; then
    echo "It's higher than that, guess again:"
  fi
done
echo "You guessed it in $ATTEMPS tries. The secret number was $NUMBER. Nice job!"

BEST_GAME=$($PSQL "SELECT MIN(guesses_best_game) FROM players 
WHERE name='$USERNAME'")

if [[ -n $BEST_GAME ]]; then
  if [[ $ATTEMPS -lt $BEST_GAME ]]; then
    BEST_GAME=$ATTEMPS
  fi
else
  BEST_GAME=$ATTEMPS
fi
UPDATE_PLAYER=$($PSQL "UPDATE players SET games_played=games_played+1, guesses_best_game=$BEST_GAME WHERE name='$USERNAME'")