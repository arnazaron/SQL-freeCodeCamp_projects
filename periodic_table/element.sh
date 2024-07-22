#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
elif [[ $1 =~ ^[0-9] ]]
then
  echo $($PSQL "SELECT atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM elements FULL JOIN properties USING(atomic_number) FULL JOIN types USING(type_id) WHERE atomic_number=$1 ORDER BY atomic_number;") | while IFS=" |" read ATOMIC_NUMBER ELEMENT_SYMBOL ELEMENT_NAME ATOMIC_MASS MELTING_POINT BOILING_POINT ELEMENT_TYPE
  do
  if ! [[ -z $ELEMENT_NAME ]]
    then
      echo "The element with atomic number $ATOMIC_NUMBER is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $ELEMENT_TYPE, with a mass of $ATOMIC_MASS amu. $ELEMENT_NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    else
      echo "I could not find that element in the database."
  fi
  done
else
  echo $($PSQL "SELECT atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM elements FULL JOIN properties USING(atomic_number) FULL JOIN types USING(type_id) WHERE name='$1' or symbol='$1' ORDER BY atomic_number;") | while IFS=" |" read ATOMIC_NUMBER ELEMENT_SYMBOL ELEMENT_NAME ATOMIC_MASS MELTING_POINT BOILING_POINT ELEMENT_TYPE
  do
  if ! [[ -z $ELEMENT_NAME ]]
    then
      echo "The element with atomic number $ATOMIC_NUMBER is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $ELEMENT_TYPE, with a mass of $ATOMIC_MASS amu. $ELEMENT_NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    else
      echo "I could not find that element in the database."
  fi
  done   
fi


       