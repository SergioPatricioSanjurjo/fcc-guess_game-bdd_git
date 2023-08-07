#!/bin/bash

#PSQL for queries
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"


#Start
FLAG=0
echo "Enter your username:"

while [[ $FLAG == 0 ]]
do
  read USERNAME
  #Check the username
  if [[ $USERNAME ]]
  then
    USER=$($PSQL "SELECT * FROM users WHERE username LIKE '$USERNAME'")
    if [[ -z $USER ]]
    then
      USER_INS=$($PSQL "INSERT INTO users(username) VALUES ('$USERNAME')")
      echo "Welcome, $USERNAME! It looks like this is your first time here."      
      ((FLAG++))
      if [[ -z $USER_INS ]]
      then
        ((FLAG--))
        echo "There was an error in the name, please insert a 22 characters or less username"
      fi
    else
      echo "$USER" | while IFS="|" read U_ID U_NAME U_GAMES U_BEST
      do
        echo  "Welcome back, $U_NAME! You have played $U_GAMES games, and your best game took $U_BEST guesses."
      done  
      ((FLAG++))
    fi
    else
      echo "Enter a name"
    fi
done

#Game Part
FLAG2=0
RAND_NUMBER=$(( $RANDOM % 1000 + 1 ))
ROUNDS=0

#Data from player 
ID=$($PSQL "SELECT user_id FROM users WHERE username LIKE '$USERNAME'")
GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username LIKE '$USERNAME'")
BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username LIKE '$USERNAME'")
#If there is not best game yet set default for comparison
if [[ -z $BEST_GAME ]]
then
  BEST_GAME=9999
fi
echo "Guess the secret number between 1 and 1000:"

while [ $FLAG2 -eq 0 ]
do 
  #Start of the game
  read GUESS
  #NAN
  if [[ ! $GUESS =~ [0-9]+ ]]
  then
    echo "That is not an integer, guess again:"
  elif [[ $GUESS != $RAND_NUMBER ]]    
  then
    #The guess is higher than the number
    if [[ $GUESS > $RAND_NUMBER ]]
    then
      ((ROUND++))
      echo "It's lower than that, guess again:"
    else
      #The guess is lower than the number
     ((ROUND++))
      echo "It's higher than that, guess again:"
    fi
  else
    #The player guessed the number
    ((ROUND++))
    echo "You guessed it in $ROUND tries. The secret number was $RAND_NUMBER. Nice job!"
    ((FLAG2++))
  fi
done


#Check for update best game
if [[ $ROUND < $BEST_GAME ]]
then
  #The player bested their last record
  SAVE_DATA=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED+1, best_game=$ROUND WHERE user_id=$ID")
else
  #The player beat the game but not his previous record
  SAVE_DATA=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED+1 WHERE user_id=$ID")
fi



