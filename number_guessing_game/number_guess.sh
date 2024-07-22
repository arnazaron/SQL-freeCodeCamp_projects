#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
echo "Enter your username:"
read USERNAME


# get username
GET_USERNAME=$($PSQL "SELECT username FROM players WHERE username = '$USERNAME';")
# get gamesplayed
GET_GAMES_PLAYED=$($PSQL "SELECT games_played FROM players WHERE username = '$USERNAME';")
# get best game
BEST_GAME=$($PSQL "SELECT best_game FROM players WHERE username = '$USERNAME';")

# set initial values of secret number, games played and number of guesses
SECRET_NUMBER=$(((RANDOM % 1000)+1))
NUMBER_GUESSES=0
NUMBER_OF_CHARACTERS=$(echo $USERNAME | wc -c)
let "NUMBER_OF_CHARACTERS--"

# game function
GAME(){
  read IMPUT_NUMBER
  let "NUMBER_GUESSES++"
  while [[ $IMPUT_NUMBER != $SECRET_NUMBER ]]
  do
  if [[ $IMPUT_NUMBER =~ ^[0-9]+$ ]]
  then

    if [[ $IMPUT_NUMBER -gt $SECRET_NUMBER ]]
    then
      echo -e "\nIt's lower than that, guess again:"
      read IMPUT_NUMBER
    elif [[ $IMPUT_NUMBER -lt $SECRET_NUMBER ]]
    then
      echo -e "\nIt's higher than that, guess again:"
      read IMPUT_NUMBER
    fi
  else
    echo -e "\nThat is not an integer, guess again:"
    let "NUMBER_GUESSES--"
    read IMPUT_NUMBER
  fi
  let "NUMBER_GUESSES++"
  #echo next guess $NUMBER_GUESSES  
  done

# update database info
if [[ $GET_GAMES_PLAYED -eq 0 ]]
then
  # first game
  let "GET_GAMES_PLAYED++"
  UPDATE1=$($PSQL "UPDATE players SET games_played = $GET_GAMES_PLAYED WHERE username = '$USERNAME';")
else
  # next game
  let "GET_GAMES_PLAYED++"
  UPDATE1=$($PSQL "UPDATE players SET games_played = $GET_GAMES_PLAYED WHERE username = '$USERNAME';")
fi

if [[ $BEST_GAME -eq 0 ]]
then
  UPDATE2=$($PSQL "UPDATE players SET best_game = $NUMBER_GUESSES WHERE username = '$USERNAME';")
elif [[ $NUMBER_GUESSES -le $BEST_GAME ]]
then
  UPDATE2=$($PSQL "UPDATE players SET best_game = $NUMBER_GUESSES WHERE username = '$USERNAME';")
fi

echo -e "\nYou guessed it in $NUMBER_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
}

# gameplay logic
if [[ $NUMBER_OF_CHARACTERS -ge 22 ]]
then
  echo -e "\nYour username should be less or equal to 22 characters."
elif [[ $USERNAME == $GET_USERNAME ]]
then
  echo -e "\nWelcome back, $USERNAME! You have played $GET_GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  echo -e "\nGuess the secret number between 1 and 1000:"
  #echo Secret $SECRET_NUMBER
  NUMBER_GUESSES=0
  GAME
else
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  INSERT_USERNAME=$($PSQL "INSERT INTO players(username) VALUES('$USERNAME');")
  echo -e "\nGuess the secret number between 1 and 1000:"
  NUMBER_GUESSES=0
  #echo Secret $SECRET_NUMBER
  GAME
fi
