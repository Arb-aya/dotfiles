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

"Nicer looking status bar
Plugin 'vim-airline/vim-airline'

" See (4) on how to get theme displaying properly
"Plugin 'vim-airline/vim-airline-themes'

"File browsing in vim
Plugin 'preservim/nerdtree'

"Run various fixers / linters
Plugin 'dense-analysis/ale'

"Python fixer
Plugin 'psf/black'

"Plugin 'liuchengxu/space-vim-dark'
Plugin 'tomasiser/vim-code-dark'

"Git functionality
Plugin 'tpope/vim-fugitive'

"Auto complete
Plugin 'ycm-core/YouCompleteMe'

"Emmet functionality...
Plugin 'mattn/emmet-vim'

"Pair brackets [](){}
Plugin 'jiangmiao/auto-pairs'

"Auto close HTML tags
Plugin 'alvan/vim-closetag'
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

au BufNeWFile,BufRead html
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
colo codedark "Colour scheme
syntax on "Syntax highlighting
set hlsearch "Highlight search terms
set incsearch "Searches are performed as you type
set splitbelow splitright "Splits open below or to the right
"Store swap files in ~/.vim/tmp
set directory^=$HOME/.vim/tmp// "https://vi.stackexchange.com/questions/177/what-is-the-purpose-of-swap-files

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
let g:airline_theme='codedark'


" -------------------- YOU COMPLETE ME
"
"Get rid of auto-complete window when we're done with it
let g:ycm_autoclose_preview_window_after_completion=1
"Go to definition under cursor
map <leader>g :YcmCompleter Goto
"Stop asking to load in .ycm_extra_conf files for python virtual environments
"Not the best way, better to use g:ycm_extra_conf_globlist, but for now it
"does
let g:ycm_confirm_extra_conf = 0


" ------------------ EMMET
"
" Remap default leader for emmet which is <C-Y>:
let g:user_emmet_leader_key=','

" Expand ! / html:5 beyond initial basic implementation
let g:user_emmet_settings = {
			\  'html': {
			\    'snippets': {
			\      'html:5': '!!!+html>(head>(meta[charset=${charset}]+meta[name="viewport" content="width=device-width,initial-scale=1.0"]+meta[http-equiv="X-UA-Compatible" content="ie=edge"]+title))+body'
			\}
			\}
			\}


" ---- NERDTREE Hide files on the fly:
"https://www.reddit.com/r/vim/comments/541xlg/nerdtree_tip_hide_files_onthefly/"
"--------------------------------------------------------------
" Hide files from NERDTree with 'dd'
" Unhide all files with 'dua'
" Unhide singular file 'dus'
let g:MyNERDTreeIgnore=[] " List of ignored files
let ignoreSingleKeyMap = {
    \ 'key':           'dd',
    \ 'callback':      'MyNERDTreeIgnoreSingle',
    \ 'scope':         'Node',
    \ 'quickhelpText': 'Hide(ignore) the selected file' }
let unignoreAllKeyMap = {
    \ 'key':           'dua',
    \ 'callback':      'MyNERDTreeUnignoreAll',
    \ 'scope':         'Node',
    \ 'quickhelpText': 'Unhide all hidden(ignored) files' }
let unignoreSingleKeyMap = {
    \ 'key':           'dus',
    \ 'callback':      'MyNERDTreeUnignoreSingle',
    \ 'scope':         'Node',
    \ 'quickhelpText': 'Unhide a single hidden(ignored) file' }
augroup NERDTreeHide
  autocmd!
  autocmd VimEnter *  call NERDTreeAddKeyMap(ignoreSingleKeyMap) |
                    \ call NERDTreeAddKeyMap(unignoreAllKeyMap) |
                    \ call NERDTreeAddKeyMap(unignoreSingleKeyMap) |
                    \ call NERDTreeAddPathFilter('MyFilter')
augroup END
"--------------------------------------------------------------------
" Ignore Single
function MyNERDTreeIgnoreSingle(node)
  let path = a:node['path'].str()
  if index(g:MyNERDTreeIgnore, path) != -1 |  return | endif " If exists, return
  call add(g:MyNERDTreeIgnore, path) | call NERDTreeRender()
endfunction
"--------------------------------------------------------------------
" Unignore all
function MyNERDTreeUnignoreAll(node)
  let g:MyNERDTreeIgnore=[] | call NERDTreeRender()
endfunction
"--------------------------------------------------------------------
" Unignore Single
function MyNERDTreeUnignoreSingle(node)
  let promptlist = ['Select File to Unhide:', '-------------------------']
  let cntr = 1
  for i in g:MyNERDTreeIgnore
    call add(promptlist, cntr . '. ' . i) | let cntr += 1
  endfor
  call inputsave() | let fileindex = (inputlist(promptlist) - 1) | call inputrestore()
  if fileindex < 0
    echom "Invalid number (Too low)" | return
  elseif fileindex > (len(g:MyNERDTreeIgnore) - 1)
    echom "Invalid number (Too high)" | return
  endif
  call remove(g:MyNERDTreeIgnore, fileindex) | call NERDTreeRender()
endfunction
"--------------------------------------------------------------------
" Ignore Filter Function
function! MyFilter(params)
  return (index(g:MyNERDTreeIgnore, a:params['path'].str()) != -1)
endfunction
