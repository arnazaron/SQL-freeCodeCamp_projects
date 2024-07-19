#!/bin/bash
echo -e "\n~~~~~ MY SALON ~~~~~\n"
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
#echo $($PSQL "TRUNCATE TABLE customers, appointments;")

echo -e "Welcome to My Salon, how can I help you?\n"

MAIN_MENU(){
  if [[ $1 ]]
  then
   echo -e "\n$1"
  fi

  SERVICES_LIST=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id;")
  echo "$SERVICES_LIST" | while read service_id BAR service_name
  do
    if [[ $service_id != "service_id" && $service_id != "(5" && $service_id != "------------+-------" ]]
    then
      echo "$service_id) $service_name"
    fi
  done

  read SERVICE_ID_SELECTED
  case $SERVICE_ID_SELECTED in
    1) CHOOSE_SERVICE ;;
    2) CHOOSE_SERVICE ;;
    3) CHOOSE_SERVICE ;;
    4) CHOOSE_SERVICE ;;
    5) CHOOSE_SERVICE ;;
    *) MAIN_MENU "I could not find that service. What would you like today?" ;;
  esac
}

CHOOSE_SERVICE(){
  echo -e "\nWhat's your phone number?\n"
  read CUSTOMER_PHONE
  # check whether phone exists
  GET_PHONE=$($PSQL "SELECT phone FROM customers WHERE phone='$CUSTOMER_PHONE';")
  FORMAT_PHONE

  if [[ $GET_PHONE == $CUSTOMER_PHONE ]]
  then
    # get customer name
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE';")
    FORMAT_CUSTOMER_NAME
  else
    # get customer name
    echo -e "\nI don't have a record for that phone number, what's your name?\n"
    read CUSTOMER_NAME
    NEW_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME');")  
  fi
  # get service
  GET_SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED;")
  FORMAT_SERVICE_NAME
  echo -e "\nWhat time would you like your $GET_SERVICE_NAME, $CUSTOMER_NAME?"
  CHECK_TIME_FORMAT
}

CHECK_TIME_FORMAT(){
  read SERVICE_TIME
  if [[ ! $SERVICE_TIME =~ ^((([0-1][0-9])|(2[0-3])):([0-5][0-9]))$|^([0-1][0-2])(am|pm)$ ]]
  then
    echo -e "\nPlease, enter the time in a proper format like HH:MM or HHam/HHpm"
    CHECK_TIME_FORMAT
  else
    # get customer's id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE name='$CUSTOMER_NAME' AND phone='$CUSTOMER_PHONE';")
    FORMAT_CUSTOMER_ID
    NEW_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');")
    #echo "Info inserted"
    echo -e "\nI have put you down for a $GET_SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}

FORMAT_SERVICE_NAME(){
  GET_SERVICE_NAME=$(echo "${GET_SERVICE_NAME/(1 row)/}")
  GET_SERVICE_NAME=$(echo "${GET_SERVICE_NAME/name/}")
  GET_SERVICE_NAME=$(echo "${GET_SERVICE_NAME/------/}")
  GET_SERVICE_NAME=$(echo "${GET_SERVICE_NAME/-/}" | tr -d [:space:])
}

FORMAT_CUSTOMER_ID(){
  CUSTOMER_ID=$(echo "${CUSTOMER_ID/customer_id/}")
  CUSTOMER_ID=$(echo "${CUSTOMER_ID/(0 rows)/}")
  CUSTOMER_ID=$(echo "${CUSTOMER_ID/(1 row)/}" | tr -d [=-=])
  CUSTOMER_ID=$(echo $CUSTOMER_ID | tr -d [:space:])
}

FORMAT_PHONE(){
  GET_PHONE=$(echo "${GET_PHONE/phone/}")
  GET_PHONE=$(echo "${GET_PHONE/(0 rows)/}")
  GET_PHONE=$(echo "${GET_PHONE/(1 row)/}")
  re="(^-*-$)"
  GET_PHONE=$(echo "${GET_PHONE/--------------/}")
  GET_PHONE=$(echo $GET_PHONE | tr -d [:space:])
}

FORMAT_CUSTOMER_NAME(){
  CUSTOMER_NAME=$(echo "${CUSTOMER_NAME/name/}")
  CUSTOMER_ID=$(echo "${CUSTOMER_NAME/(0 rows)/}")
  CUSTOMER_NAME=$(echo "${CUSTOMER_NAME/(1 row)/}" | tr -d [=-=])
  CUSTOMER_NAME=$(echo $CUSTOMER_NAME | tr -d [:space:])
}
MAIN_MENU