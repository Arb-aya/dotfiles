#!/bin/bash

# Uses following to create virtualenv
#       pyenv/pyenv https://github.com/pyenv/pyenv
#       pyenv/pyenv-virtualenv https://github.com/pyenv/pyenv-virtualenv
setup_python_project(){

    local can_create_venv=true

    if [[ $# -ne 2 ]]; then
       return 1
    fi

    #Check we have pyenv installed
    if [[ ! -x "$(command -v pyenv)" ]]; then
        printf "pyenv command not found...\n"
        $can_create_venv=false
    fi

    #Check we have pyenv installed
    if [[ ! -x "$(command -v pyenv virtualenv)" ]]; then
        printf "pyenv virtualenv not found...\n"
        $can_create_venv=false
    fi

    #Try to create virtual environment named after project
    if [[ $can_create_venv ]]; then
        pyenv virtualenv $2
        if [[ $? -ne 0 ]]; then
            printf "Error creating virtual environment for %s\n" $2
        else
            #Create .python-version file so the venv is automatically activated
            #and deactivated by pyenv-virtualenv
            touch "$1/.python-version"

            if [[ $? -ne 0 ]]; then
                printf "Error creating .python-version file for %s\n" $1
            else
                echo "$2" > "$1/.python-version"
            fi
        fi
    else
        printf "you will need to manually create a virtual environment.\n"
    fi

}


# Process optional flags
optional_count=0
load_discretely=0

while getopts ":nd" opt; do
     case $opt in
         n)
             tmuxp load -d "$HOME/.tmuxp/notes.json"
             let "optional_count=optional_count+1"
         ;;

         d)
             let "load_discretely=load_discretely+1"
             let "optional_count=optional_count+1"
            ;;

        \?)
             printf "Invalid option: -$OPTARG" >&2
             exit 1
         ;;
         #:)
             #printf "Option -$OPTARG requires an argument." >&2
             #exit 1
         #;;
     esac
done

#If there were any optional args, shift parameters left that amount
shift $optional_count
#If we don't have two arguments, tell the user we need them and bail
if [[ $# -ne 2 ]]; then
    printf "Usage: ./dev.sh <language> <project name>\n"
    exit 1
fi

#Make language all lowercase
language=${1,,}
#Make first letter uppercase
language=${language^}

#Onus is on user to make sure project name is typed correctly
project=$2

#TODO: Give user option to configure where projects are created
project_path="$HOME/Documents/$language/$project/"

    if [[ ! -d $project_path ]]; then
        printf "%s doesn't exist, create it? [y/n]:" $project_path
        read -n 1 ans
        printf "\n"

        if [[ $ans == "y" || $ans == "Y"  ]]; then
            mkdir -p $project_path

            if [[ $? -eq 0 ]]; then
                printf "%s created.\n" $project_path
            else
                printf "Could not create %s\n" $project_path
                exit 1
            fi

           case $language in
                "Python")
                    printf "Setting up python project..\n"
                    setup_python_project $project_path $project
                ;;
                *)
                    printf "No specific configs for %s\n" $language
                ;;
            esac
        else
            printf "Exiting\n"
            exit 0
        fi
    fi

    #If we reach this point the directory already exists or it has been created
    #TODO Allow user to change location of tmuxp home use YAML?
    printf "Tmuxp exists..."
    if [[ -x "$(command -v tmuxp)" ]]; then
        printf "true\n"
        printf "Looking for tmuxp config for $project\n"
        if [[ -e "$HOME/.tmuxp/$project.json" ]]; then
            if [[ $load_discretely -ne 0 ]]; then
                tmuxp load -d "$HOME/.tmuxp/$project.json" && printf "\n"
            else
                tmuxp load "$HOME/.tmuxp/$project.json" && printf "\n"
            fi
        fi
    else
        printf "false\n"
    fi

    printf "done.\n"
 exit 0
