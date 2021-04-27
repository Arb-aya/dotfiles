#!/bin/bash

back_up_dir="$HOME/Documents/dotfiles/"

make_backup(){
    printf "Backing up init.lua..."
    cp  $HOME/.config/nvim/init.lua $back_up_dir

    printf "Backing up nvim/lua..."
    cp -r $HOME/.config/nvim/lua $back_up_dir
    printf $?
    printf "\n"

    printf "Backup up efm-langserver config ..."
    cp $HOME/.config/efm-langserver/config.yaml $back_up_dir
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


    printf "Backing up bash_aliases..."
    cp -r $HOME/.bash_aliases $back_up_dir
    printf $?
    printf "\n"

    printf "Backing up notes..."
    cp -r $HOME/Documents/Notes/ $back_up_dir
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
