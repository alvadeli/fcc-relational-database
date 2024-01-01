#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table --no-align --tuples-only -c"

if [[ "$#" -eq 0 ]] 
then
  echo "Please provide an element as an argument."
else
  ELEMENT_INF0=''
  ELEMENT_TABLE_QUERY="SELECT * FROM elements 
  INNER JOIN properties USING(atomic_number) 
  INNER JOIN types USING(type_id)"
  if [[ $1 =~ ^[0-9]+$ ]]
  then
     ATOMIC_NUMBER=$1
     ELEMENT_INFO=$($PSQL "$ELEMENT_TABLE_QUERY WHERE atomic_number=$ATOMIC_NUMBER")
  elif [[ $1 =~ ^[A-Za-z]{1,2}$ ]]
  then 
    SYMBOL=$1
    ELEMENT_INFO=$($PSQL "$ELEMENT_TABLE_QUERY WHERE symbol='$SYMBOL'")
  elif [[ $1 =~ ^[A-Z][a-z]{2,}$ ]]
  then 
    NAME=$1
    ELEMENT_INFO=$($PSQL "$ELEMENT_TABLE_QUERY WHERE name='$NAME'")
  
  fi

  if [[ -z $ELEMENT_INFO ]]
  then
    echo "I could not find that element in the database."
  else
      #echo "$ELEMENT_INFO"
      IFS='|' read -ra array <<< "$ELEMENT_INFO"
      ATOMIC_NUMBER=${array[1]}
      SYBMOL=${array[2]}
      NAME=${array[3]}
      MASS=${array[4]}
      MELTING_POINT=${array[5]}
      BOLIING_POINT=${array[6]}
      TYPE=${array[7]}
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYBMOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOLIING_POINT celsius."
  fi
fi
