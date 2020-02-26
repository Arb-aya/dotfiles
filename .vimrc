" SOURCES
" (1) - https://realpython.com/vim-and-python-a-match-made-in-heaven
" (2) - https://github.com/VundleVim/Vundle.vim
" (3) - https://www.davidbegin.com/p/372a73d0-1917-4f1c-8eb0-9d2bd133a374/

" Required by vundle (2)
set nocompatible 
filetype off

" Set the runtime path to include vundle and initialize (2)
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

"LIST PLUGINS BELOW HERE v

" Manage folds in vim, respecting python indentation (1)
Plugin 'tmhedberg/SimpylFold'

" Auto indent conforming ot PEP 8 standards (1)
Plugin 'vim-scripts/indentpython.vim'

"LIST PLUGINS ABOVE HERE ^

call vundle#end()
filetype plugin indent on


"PEP8 Indentation (1)
au BufNewFile,BufRead *.py
	\set tabstop=4
	\set softtabstop=4
	\set shiftwidth=4
	\set textwidth=79
	\set expandtab " Expand tab to spaces
	\set autoindent " Auto indent on new lines when coding
	\set fileformat=unix "Prevent conversion issues with github

au BufNeWFile,BufRead *.html, *.js, *.css
	\set tabstop=2
	\set softtabstop=2
	\set shiftwidth=2

" Disable arrow keys in escape mode (3)
map <up> <nop> 
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable arrow keys in insert mode (3)
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Fullscreen a split (3)
noremap ff :resize 100 <cr> <bar> :vertical resize 220<cr>

" Resize to view all splits (3)
noremap fm <C-w>= 

" Navigate between splits (3)
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Go to current folder and navigate it (3)
noremap <leader>e :edit %:h<cr>

" Reload the vimrc in vim (3)
noremap <leader>rc :source ~/.vimrc<cr>

" Support utf-8
set encoding=utf-8

" Line numbers
set number



