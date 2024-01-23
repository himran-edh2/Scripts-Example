#!/bin/bash

# Loops menu while user is selecting an option
while true;
do
	# All possible menu options
	echo "Please select one of the following:"
	echo "1. List records in alphabetical order by first or last name."
	echo "2. List records in reverse alphabetical order by first or last name."
	echo "3. Search for record by last name."
	echo "4. Search for record by birth month or year"
	echo "5. Exit"
	# Opts user for input and reads input
	echo "Enter option: "
	read option

	# Gets appropriate record(s) according to selected option
	case $option in
		1)
			echo "Firt name or Last name? (F/L): "
			read choice
			if [ $choice == "F" ] || [ $choice == "f" ];
			then
				sort "datebook.txt"
			else
				sort -k 2 "datebook.txt"
			fi
			;;
		2)
			echo "First name or Last name? (F/L): "
			read choice
			if [ $choice == "F" ] || [ $choice == "f" ];
			then
				sort -r "datebook.txt"
			else
				sort -r -k 2 "datebook.txt"
			fi
			;;
		3)
			echo "Enter last name: "
			read lastName
			awk -v var=$lastName '/var/ {print}' "datebook.txt"
			;;
		4)
			echo "Enter birth month or year: "
			read birth
			awk  -v var=$birth '{if ($6 ~ birth) print}' "datebook.txt"
			;;
		5)
			echo "Exited"
			exit 0
			;;
		*)
			echo "Invalid option"
			;;
	esac
	# Prints an empty line for spacing
	echo ""
done
