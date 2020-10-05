#!/bin/bash

back_up_dir="$HOME/Documents/dotfiles/"

make_backup(){
    printf "Backing up init.vim..."
    cp $HOME/.config/nvim/init.vim $back_up_dir
    printf $?
    printf "\n"

    printf "Backing up coc-settings.json..."
    cp $HOME/.config/nvim/coc-settings.json $back_up_dir
    printf $?
    printf "\n"


    printf "Backing up ./tmuxp..."
    cp -r $HOME/.tmuxp/ $back_up_dir
    printf $?
    printf "\n"

    printf "Backing up scripts..."
    cp -r $HOME/Documents/Scripts $back_up_dir
    printf $?
    printf "\n"

    printf "Push to github? [y/n]"
    read -n 1 ans
    printf "\n"
    
    if [[ $ans == "y" || $ans == "Y" ]];then
        cd $back_up_dir
        git add .
        git commit -m "Update .dotfiles"
        git push
    fi
}

update(){
    echo "update here"
}
 
if [[ $# -ne 1 ]];then
 printf "Usage: ./dotfiles <update/backup>\n"
fi

case $1 in
    "update")
        update
        ;;
    "backup")
        make_backup
        ;;
    *)
        printf "Command not recognised\n"
        ;;
esac
