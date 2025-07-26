#!/bin/bash

echo "WELCOME TO EKUKE AUTOMOBILE"
echo "Type: 'help' to display available commands"
echo "Type: 'drive' to activate Driving mode"
echo "type: 'park' to activate Parking mode"
echo "Type: 'reverse' to activate reversing mode"

echo "Name of car"

read CAR

echo "$CAR Registered successfully!"

SHOULD_EXECUTE=true
ENGINE_IS_ON=false
IS_DRIVING=true
CURRENT_MODE="none"

while $SHOULD_EXECUTE; do

echo "Enter Command"

read COMMAND

if [[ $COMMAND == help ]];
then
	echo "AVAILABLE COMMANDS"
	echo "To start $CAR engine, type: 'start'"
	echo "To stop $CAR engine, type: 'stop'"
	echo "To exit the program type: 'exit'"

elif [[ $ENGINE_IS_ON == true && $COMMAND == D && $CURRENT_MODE == D ]];
then
	echo "$CAR is already in Driving mode"

elif [[ $ENGINE_IS_ON == true && $COMMAND == D ]];
then
	CURRENT_MODE=D

	echo "$CAR Driving mode activated"
	echo "$CAR is Driving"

elif [[ $ENGINE_IS_ON == false && $COMMAND == D && $IS_DRIVING == true ]];
then
	echo "Please start $CAR Engine to Drive"
	echo "Type 'start' to start $CAR Engine"

elif [[ $ENGINE_IS_ON == false && $COMMAND == P ]]
then
	echo "$CAR is already in Parking mode"

elif [[ $ENGINE_IS_ON == true && $COMMAND == P ]]
then
	echo "Parking Mode activated"

elif [[ $IS_DRIVING == true && $COMMAND == P ]]
then
	echo "$CAR cannot Park while Driving. Please stop $CAR before activating Parking mode"

elif [[ $ENGINE_IS_ON == true && $COMMAND == R && $CURRENT_MODE == R ]];
then
        echo "$CAR is already in Reverse mode"

elif [[ $ENGINE_IS_ON == true && $COMMAND == R ]];
then
	CURRENT_MODE=R

	echo "$CAR Reverse mode activated"
	echo "$CAR is Reversing"

elif [[ $ENGINE_IS_ON == false && $COMMAND == R ]];
then		
	echo "Please start $CAR before Reversing"
	echo "Please type 'start' to start $CAR"

elif [[ $ENGINE_IS_ON == false && $COMMAND == start ]];
then
	ENGINE_IS_ON=true

	echo "starting $CAR Engine"
	echo "$CAR Engine is ON"
	echo "Type 'P' to park $CAR"
	echo "Type 'D' to drive $CAR"
	echo "Type 'R' to reverse $CAR"

elif [[ $ENGINE_IS_ON == true && $COMMAND == start ]];
then
	echo "$CAR Engine is already ON"

elif [[ $ENGINE_IS_ON == true && $COMMAND == stop ]];
then
	ENGINE_IS_ON=false

	echo "stopping $CAR engine"
	echo "$CAR engine is OFF"
	echo "please exit $CAR"

elif [[ $ENGINE_IS_ON == false && $COMMAND == stop ]];
then
	echo "$CAR Engine is already OFF"

elif [[ $COMMAND == exit ]];
then
	echo "Terminating program...
	Goodbye!"

	SHOULD_EXECUTE=false

else
	echo "Invalid command: Type 'help' to display available commands"

fi

done	
