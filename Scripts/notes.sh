
#!/bin/bash

notes_dir ="$HOME/Documents/notes/"

if [[ $# -ne 1 ]];then
 printf "Usage: ./notes.sh <notes name>\n"
else
	if [[-f "$notes_dir/$1"]];then
		vim $notes_dir/$1
	fi
fi

