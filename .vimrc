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

Plugin 'vim-airline/vim-airline'

Plugin 'vim-airline/vim-airline-themes'

Plugin 'ycm-core/YouCompleteMe'

Plugin 'psf/black'
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

"Execute Black when saving py files
autocmd BufWritePre *.py execute ':Black'

" Disable arrow keys in escape mode (3)
map <Up> <nop>
map <Down> <nop>
map <Left> <nop>
map <Right> <nop>

" Disable arrow keys in insert mode (3)
imap <Up> <nop>
imap <Down> <nop>
imap <Left> <nop>
imap <Right> <nop>

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

" Toggle relative line numbers 
nmap <space> :set invrelativenumber<cr>

"YCM auto-complete window goes away when we're done with it
let g:ycm_autoclose_preview_window_after_completion=1

"Goto definition under cursor
map <leader>g :YcmCompleter GoTo<cr>

"python with virtual env support (1)
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
	project_base_dir = os.environ['VIRTUAL_ENV']
	activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
	execfile(activate_this, dict(__file__=activate_this))
EOF

let g:black_virtualenv="~/.vim_black"
let python_highlight_all=1
syntax on
