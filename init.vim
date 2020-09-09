"------------------------------
"   SOURCES
"   (1) https://www.davidbegin.com/p/372a73d0-1917-4f1c-8eb0-9d2bd133a374
"   (2) https://jdhao.github.io/2018/12/24/centos_nvim_install_use_guide_en/
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
set foldmethod=indent



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

let mapleader = ","

" remap esc
imap jk <esc>

"Disable esc in insertmode
map <esc> <nop>

"Disable mouse scroll wheel (1)
inoremap <ScrollWheelUp> <nop>
inoremap <ScrollWheelDown> <nop>

"Reload the init.vim from vim (1)
noremap <leader>rr:source ~/.config/nvim/init.vim<cr>

"Toggle relative line numbers
nmap <space> :set invrelativenumber<cr>

nnoremap <esc> :noh<return><esc>
noremap ,, <esc>:w!<cr>

" Tab through autocomplete suggestions (2)
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

nnoremap confe :e ~/.config/nvim/init.vim<cr>
nnoremap confr :source ~/.config/nvim/init.vim<cr>

"------------------------------
"   VIM-PLUG
"------------------------------

call plug#begin('~/.local/share/nvim/plugged')
Plug 'Shougo/deoplete.nvim', {'do':  ':UpdateRemotePlugins'} 

Plug 'zchee/deoplete-jedi'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'jiangmiao/auto-pairs'

Plug 'scrooloose/nerdcommenter'

Plug 'scrooloose/nerdtree'

Plug 'sbdchd/neoformat'

Plug 'davidhalter/jedi-vim'

Plug 'machakann/vim-highlightedyank'

Plug 'tmhedberg/SimpylFold'

Plug 'morhetz/gruvbox'

call plug#end()

"------------------------------
" PLUGIN SETTINGS 
"------------------------------

" DEOPLETE 
let g:deoplete#enable_at_startup = 1

" Close function sig window for autocomplete (2)
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif 

" VIM-AIRLINE
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'

" NERDTREE
map <C-n> :NERDTreeToggle<cr>

" NEOFORMAT
let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim = 1

let g:jedi#completions_enabled = 0
let g:jedu#use_split_not_buffers = "right"

" GRUVBOX
autocmd vimenter * colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
