" SOURCES
" (1) - https://realpython.com/vim-and-python-a-match-made-in-heaven
" (2) - https://github.com/VundleVim/Vundle.vim
" (3) - https://www.davidbegin.com/p/372a73d0-1917-4f1c-8eb0-9d2bd133a374/
" (4) - https://vi.stackexchange.com/questions/3359/how-do-i-fix-the-status-bar-symbols-in-the-airline-plugin
"
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

" See (4) on how to get theme displaying properly
Plugin 'vim-airline/vim-airline-themes'

Plugin 'preservim/nerdtree'

Plugin 'dense-analysis/ale'

Plugin 'psf/black'

Plugin 'liuchengxu/space-vim-dark'

Plugin 'tpope/vim-fugitive'

Plugin 'ycm-core/YouCompleteMe'

Plugin 'jiangmiao/auto-pairs'
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

" -------------------- KEY MAPPINGS
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

"Disable mouse scroll wheel
inoremap <ScrollWheelUp> <nop>
inoremap <ScrollWheelDown> <nop>

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

" Toggle relative line numbers
nmap <space> :set invrelativenumber<cr>

" -------------------- SETTINGS
"
set encoding=utf-8 " Support utf-8
set number " Line numbers
colo space-vim-dark "Colour scheme
syntax on "Syntax highlighting
set hlsearch "Highlight search terms
set incsearch "Searches are performed as you type
set splitbelow splitright "Splits open below or to the right

"python with virtual env support (1)
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
	project_base_dir = os.environ['VIRTUAL_ENV']
	activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
	execfile(activate_this, dict(__file__=activate_this))
EOF

" -------------------- NERD TREE
"
" Toggle with Ctrl-n
map <C-n> :NERDTreeToggle<CR>


" -------------------- ALE
let g:ale_linters = {'python': ['flake8', 'pydocstyle', 'bandit', 'mypy']}
let g:ale_fixers = {
\	'*': ['remove_trailing_lines', 'trim_whitespace'],
\	'python':['black', 'isort'],
\}
let python_highlight_all=1 " Highlight for python

let g:ale_fix_on_save = 1

" -------------------- BLACK
"
"  Helps it work in venv?
let g:black_virtualenv="~/.vim_black"


" -------------------- AIRLINE
"
" Disaable default vim mode text
set noshowmode

"Enable powerline for vim
let g:airline_powerline_fonts = 1

"Airline theme
let g:airline_theme='deus'


" -------------------- YOU COMPLETE ME
"
"Get rid of auto-complete window when we're done with it
let g:ycm_autoclose_preview_window_after_completion=1
"Go to definition under cursor
map <leader>g :YcmCompleter Goto
