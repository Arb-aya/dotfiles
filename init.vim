"------------------------------
"   SOURCES
"   (1) https://www.davidbegin.com/p/372a73d0-1917-4f1c-8eb0-9d2bd133a374
"   (2) https://jdhao.github.io/2018/12/24/centos_nvim_install_use_guide_en/
"   (3) https://github.com/deoplete-plugins/deoplete-jedi/wiki/Setting-up-Python-for-Neovim
"------------------------------

"------------------------------
" 	GENERAL SETTINGS
"------------------------------

set hlsearch 	"Highlight search terms
set incsearch	"Searches are performed as you type
set number	"So line numbers
set expandtab	"Expand tabs into spaces
set tabstop=8
set softtabstop=0
set tabstop
set shiftwidth=4
set smarttab
set noswapfile
set termguicolors
"set foldmethod=indent

"------------------------------
"	KEY MAPPINGS
"------------------------------
"Disable arrow keys in escape mode (1)
map <Up> <nop>
map <Down> <nop>
map <Left> <nop>
map <Right> <nop>

"Disable arrow keys in insert mode (1)
imap <Up> <nop>
imap <Down> <nop>
imap <Left> <nop>
imap <Right> <nop>

"Vim splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

noremap ff :resize 100 <cr> <bar> :vertical resize 220<cr>
noremap fm <C-w>=

set splitbelow
set splitright

" Install xclip to access system clipboard buffers
set clipboard+=unnamedplus

" Enter terminal emulate in insert mode automatically
autocmd TermOpen * startinsert

"Folding (Unfold all folds when opening a buffer)(3)
"autocmd BufWinEnter * silent! :%foldopen!

"Leader
let mapleader = ","

" remap esc
imap jk <esc>

"Disable mouse scroll wheel (1)
inoremap <ScrollWheelUp> <nop>
inoremap <ScrollWheelDown> <nop>

"Toggle relative line numbers
nmap <space> :set invrelativenumber<cr>

nnoremap <esc> :noh<return><esc>
noremap ,, <esc>:w!<cr>


nnoremap confe :e ~/.config/nvim/init.vim<cr>
nnoremap confr :source ~/.config/nvim/init.vim<cr>

"------------------------------
"   VIM-PLUG
"------------------------------

call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/deoplete.nvim', {'do':  ':UpdateRemotePlugins'}

Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'deoplete-plugins/deoplete-jedi'

Plug 'jiangmiao/auto-pairs'

Plug 'scrooloose/nerdcommenter'

Plug 'scrooloose/nerdtree'

Plug 'machakann/vim-highlightedyank'

Plug 'dense-analysis/ale'

Plug 'morhetz/gruvbox'

Plug 'tpope/vim-surround'

Plug 'Yggdroot/indentline'

Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'tpope/vim-fugitive'

call plug#end()

"------------------------------
" PLUGIN SETTINGS
"------------------------------

" DEOPLETE
let g:python3_host_prog = '~/.pyenv/versions/3.8.2/bin/python'
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('auto_complete_delay', 100) "Prevent deoplete slowing semshi

" Close function sig window for autocomplete (2)
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

"Tab through autocomplete suggestions (2)
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
"Tab backwards
inoremap <expr><S-tab> pumvisible() ? "\<c-p>" : "\<S-tab>"
" VIM-AIRLINE
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'
let g:airline#extensions#ale#enabled = 1
" NERDTREE
map <C-n> :NERDTreeToggle<cr>

"Close vim if nerdtree is the last buffer open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" INDENTLINE
set list
set listchars=eol:↴
set listchars+=tab:│⋅
set listchars+=trail:•
set listchars+=extends:❯
set listchars+=precedes:❮
set listchars+=nbsp:_
set listchars+=space:⋅
set showbreak=↳⋅
set conceallevel=2
set concealcursor=n
let g:indentLine_char = '│'
let g:indentLine_first_char = g:indentLine_char
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_color_gui = '#a89984'
let g:indentLine_bgcolor_gui = 'NONE'
let g:indentLine_setConceal = 0
let g:indentLine_autoResetWidth = 0
let g:indent_blankline_space_char = ' '
let g:indent_blankline_debug = v:true

" GRUVBOX
colorscheme gruvbox

" Semshi highlight colours
function CustomHighlights()
        hi semshiImported guifg=#fb4934 gui=bold
        hi semshiSelected guifg=#1d2021 guibg=#8ec07c
        hi semshiParameter guifg=#fabd2f
        hi semshiParameterUnused guifg=#a89984 guibg=#32302f cterm=none gui=none
        hi semshiBuiltin guifg=#d3869b
        hi semshiUnresolved guifg=#b8bb26
        hi semshiSelf guifg=#83a596
        hi semshiLocal guifg=#00FF00
        hi semshiGlobal guifg=#00FF00
        hi semshiFree guifg=#00ff00
endfunction
"Important to let semshi load defaults first then change them
autocmd FileType python call CustomHighlights()
"Retain custom highlights on colour change
autocmd ColorScheme * call CustomHighlights()

" ALE
"We're using deoplete for completion
let g:ale_completion_enabled = 0

let g:ale_linters = {
        \'python':['flake8'],
        \'javascript':['eslint'],
\}

let g:ale_fixers={
        \'*': ['remove_trailing_lines','trim_whitespace'],
        \'python': ['yapf','isort'],
        \'javascript': ['prettier']
\}

let g:ale_fix_on_save = 1

let g:semshi#error_sign=0
