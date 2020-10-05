#!/bin/bash

echo "Pyenv..."

cd $(pyenv root)
git pull

#echo "Pynvim in neovim3 venv..."
#pyenv activate neovim3
#pip install -U pynvim


echo "... finished"

