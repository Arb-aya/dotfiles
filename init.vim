"------------------------------
"   SOURCES
"   (1) https://www.davidbegin.com/p/372a73d0-1917-4f1c-8eb0-9d2bd133a374
"   (2) https://jdhao.github.io/2018/12/24/centos_nvim_install_use_guide_en/
"   (3)
"   https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfold-when-you-open-a-file
"------------------------------

"------------------------------
" 	GENERAL SETTINGS	
"------------------------------

set hlsearch 	"Highlight search terms	
set incsearch	"Searches are performed as you type
set number	"So line numbers	
set expandtab	"Expand tabs into spaces
set tabstop=2
set softtabstop=2
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


Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'jiangmiao/auto-pairs'

Plug 'scrooloose/nerdcommenter'

Plug 'scrooloose/nerdtree'

Plug 'sbdchd/neoformat'

Plug 'davidhalter/jedi-vim'

Plug 'machakann/vim-highlightedyank'

"Plug 'tmhedberg/SimpylFold'

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
let g:deoplete#enable_at_startup = 1

" Close function sig window for autocomplete (2)
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif 

"Tab through autocomplete suggestions (2)
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" VIM-AIRLINE
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'

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
