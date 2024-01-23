#!/bin/csh

# Initialize a variable to start loop
set loop = 0

# Loops menu while user is selecting an option
while ($loop == 0)
	#All possible menu options
	echo "Please select one of the following options: "
	echo "1. List records in alphabetical order by first or last name."
	echo "2. List records in reverse alphabetical order by first or last name."
	echo "3. Search for record by last name"
	echo "4. Search for record by birth month or year"
	echo "5. Exit"
	# Opts user for input and reads input
	echo "Enter choice: "
	set option = $<

	# Gets appropriate record(s) according to selected option
	switch ($option)
		case 1:
			echo "First or Last name? (F/L): "
			set choice = $<
			if ($choice == "F" || $choice == "f") then
				sort "datebook.txt"
			else
				sort -k 2 "datebook.txt"
			endif
			breaksw
		case 2:
			echo "First or Last name? (F/L): "
 			set choice = $<
 			if ($choice == "F" || $choice == "f") then
 				sort -r "datebook.txt"
 			else
 				sort -r -k 2 "datebook.txt"
 			endif
			breaksw
		case 3:
			echo "Enter last name:"
			set lastName = $<
			awk -v var=$lastName '/var/ {print}' "datebook.txt"
			breaksw
		case 4:
			echo "Enter birth month or year:"
			set birth = $<
			awk -v var=$birth '(if ($6 ~ birth) print}' "datebook.txt"
			breaksw
		case 5:
			echo "Exited"
			exit 0
			breaksw
		default:
			echo "Invalid choice"
			breaksw
	endsw
	# Prints an empty line for spacing
	echo ""
end
