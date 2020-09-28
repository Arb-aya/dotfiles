"------------------------------
"   SOURCES
"   (1) https://www.davidbegin.com/p/372a73d0-1917-4f1c-8eb0-9d2bd133a374
"   (2) https://jdhao.github.io/2018/12/24/centos_nvim_install_use_guide_en/
"   (3) https://github.com/deoplete-plugins/deoplete-jedi/wiki/Setting-up-Python-for-Neovim
"------------------------------

"------------------------------
"   VIM-PLUG
"------------------------------

call plug#begin('~/.local/share/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/nerdcommenter'

Plug 'scrooloose/nerdtree'

Plug 'machakann/vim-highlightedyank'

Plug 'joshdick/onedark.vim'

Plug 'tpope/vim-surround'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Using plugin coc-python
" :CocInstall coc-python

" Fuzzy file finding
Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Needs to be loaded after a load of plugins, easier to
" load it last
Plug 'ryanoasis/vim-devicons'

call plug#end()
"------------------------------
" 	GENERAL SETTINGS
"------------------------------
let mapleader = ","
set encoding=utf8


"Colours / Theme
" Need a Nerd font to work with some plugins. I set this in the terminal
" currently using Fira Code

if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if( has("termguicolors"))
    set termguicolors
endif

let g:onedark_termcolors=256

syntax on
colorscheme onedark

"Change coc highlighting under the cursor to make it more visible
highlight CocHighlightText ctermfg=26 ctermbg=103 guifg=#282c34 guibg=#abb2bf
" TABS
set expandtab	"Expand tabs into spaces
set tabstop=8
set softtabstop=0
set shiftwidth=4
set smarttab
set noswapfile

set hidden
set updatetime=300
" SEARCH
set hlsearch 	"Highlight search terms
set incsearch	"Searches are performed as you type

" LINE NUMBERS
set number  	"show line numbers

"Disable arrow keys in escape mode (1)
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

"Disable arrow keys in insert mode (1)
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

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

" Embedded Terminals
"Start embedded terminals in insert mode
autocmd TermOpen * startinsert

"Open terminals in a new split at the bottom of the screen
nnoremap <c-n> :split <bar> :resize 10 <bar> :terminal <cr>
tnoremap <Esc> <C-\><C-n>

" remap esc
inoremap jk <esc>

"Disable mouse scroll wheel (1)
inoremap <ScrollWheelUp> <nop>
inoremap <ScrollWheelDown> <nop>

"Toggle relative line numbers
nmap <space> :set invrelativenumber<cr>

nnoremap <esc> :noh<return><esc>

noremap ,, <esc>:w!<cr>

" Config edit shortcuts inside of vim
nnoremap confe :e ~/.config/nvim/init.vim<cr>
nnoremap confr :source ~/.config/nvim/init.vim<cr>

" Show special characters in vim
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

let g:python3_host_prog = '~/.pyenv/versions/3.8.2/bin/python'
"------------------------------
" PLUGIN SETTINGS
"------------------------------
" VIM-AIRLINE
let g:airline_powerline_fonts = 1
let g:airline_theme='onedark'
let g:airline#extensions#ale#enabled = 1

"NERDTREE
nnoremap <silent> <C-b> :NERDTreeToggle<cr>

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusLine = ''
"Close vim if nerdtree is the last buffer open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"FZF
nnoremap <C-p> :FZF<cr>
let g:fzf_action={
            \'ctrl-t': 'tab-split',
            \'ctrl-s': 'split',
            \'ctrl-v': 'vsplit'
            \}

"COC
let g:coc_global_extensions = ['coc-eslint','coc-highlight', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-python', 'coc-prettier']

"Use tab for trigger completion 
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * call CocActionAsync('highlight')

" Rename
nmap <leader>rn <Plug>(coc-rename)

