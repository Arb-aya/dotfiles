
"#################################################################################################### 
"###                                                                                              ###
"###                                          PLUGINS                                             ###
"###                                                                                              ###
"#################################################################################################### 

call plug#begin('~/.local/share/nvim/plugged')

"airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"commenting/uncommenting
Plug 'scrooloose/nerdcommenter'

"filebrowsing
Plug 'scrooloose/nerdtree'

"show what's been yanked
Plug 'machakann/vim-highlightedyank'

" theme
Plug 'morhetz/gruvbox'

" surround and repeat to repeat surround commands
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" show git symbols in the gutter
Plug 'airblade/vim-gitgutter'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Things I use with coc.nvim see g:coc_global_extensions

"Javascript related highlighting
Plug 'pangloss/vim-javascript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'

" Fuzzy file finding
Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Show icons for file types in nerdtree
" Needs to be loaded after a load of plugins, easier to
" load it last
Plug 'ryanoasis/vim-devicons'

call plug#end()



"#################################################################################################### 
"###                                                                                              ###
"###                                          GENERAL                                             ###
"###                                                                                              ###
"#################################################################################################### 

let mapleader = ","

"Don't want no swap, a swap is the kinda file that don't get no love from me
set noswapfile

" TAB management
" tabstop = how many columns a tab counts for
"
" expandtab = pressing tab in insert mode will produce the appropriate number
" of spaces
"
"shiftwidth = control how many columns text is affected by with << >> 
"
"softabstop = how many columns vim uses when tab is used in insert mode 
"  if softtab is less than tabstop and expand is NOT set vim uses a combination
"  of tabs and spaces to make up the desired spacing.
"
"
"  if softtab is equal to tabstop and extandtab is not set vim will always use
"  tabs
"
"  If expandtab is set vim will always use the appropriate number of spaces
"
set softtabstop=0
set tabstop=2 
set shiftwidth=2 
set autoindent
autocmd Filetype python setlocal tabstop=4 shiftwidth=4 

" set hidden  "Hides buffers instead of closing them.

set updatetime=300 " More responsive feel from coc

set hlsearch 	"Highlight search terms
set incsearch	"Searches are performed as you type

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

"Neovim Embedded Terminals
"Start embedded terminals in insert mode
autocmd TermOpen * startinsert

"Open terminals in a new split at the bottom of the screen
nnoremap <c-n> :split <bar> :resize 10 <bar> :terminal <cr>
tnoremap <Esc> <C-\><C-n>

" remap esc
inoremap jk <esc>

"Disable mouse scroll wheel 
inoremap <ScrollWheelUp> <nop>
inoremap <ScrollWheelDown> <nop>

"Toggle relative line numbers
nmap <space> :set invrelativenumber<cr>

"Clear search highlight
nnoremap <esc> :noh<return><esc>

" save with ,,
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

syntax on

"Needed when working with virtual environments for vim. Has a clean python for
"vim to use
let g:python3_host_prog = '~/.pyenv/versions/neovim3/bin/python'

"#################################################################################################### 
"###                                                                                              ###
"###                                          THEME                                               ###
"###                                                                                              ###
"#################################################################################################### 

if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if( has("termguicolors"))
    set termguicolors
endif

colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'

"Transparent background
hi Normal guibg=NONE ctermbg=NONE

"Change coc highlighting under the cursor to make it more visible
highlight CocHighlightText ctermfg=26 ctermbg=103 guifg=#282c34 guibg=#abb2bf


"#################################################################################################### 
"###                                                                                              ###
"###                                          VIM-AIRLINE                                         ###
"###                                                                                              ###
"#################################################################################################### 
let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'
let g:airline#extensions#ale#enabled = 1


"#################################################################################################### 
"###                                                                                              ###
"###                                          NERDTREE                                            ###
"###                                                                                              ###
"#################################################################################################### 

"How do you open nerdtree?
nnoremap <silent> <C-b> :NERDTreeToggle<cr>

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusLine = ''
"Close vim if nerdtree is the last buffer open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"#################################################################################################### 
"###                                                                                              ###
"###                                          FZF                                                 ###
"###                                                                                              ###
"#################################################################################################### 

"Ctrl-p to find
nnoremap <C-p> :FZF<cr>
"ctrl t to open in a new tab
"ctrl s to open in a horizontal split
"ctrl v to open in a vertical split
let g:fzf_action={
            \'ctrl-t': 'tab-split',
            \'ctrl-s': 'split',
            \'ctrl-v': 'vsplit'
            \}

"also search hidden files
"ignore git files when seaching
"You need to install ag for this to work as FZF defaults to using find
"apt-get install silversearcher-ag
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""' 



"#################################################################################################### 
"###                                                                                              ###
"###                                          COC                                                 ###
"###                                                                                              ###
"#################################################################################################### 

"Coc extensions to install when you use vim. Easier to list them here and then
"forget about them. Use :CocList extensions to manage them (press tab on an
"extension for options)
let g:coc_global_extensions = ['coc-eslint','coc-highlight', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-python', 'coc-prettier']

" I disable coc-highlight for javascript so I can use other plugins for
" those filetypes. Provides a better experience for react.
" This is done by adding: highlight.disableLanguages":["javascript"] to
" :CocConfig

" When working with python virual environments, sometimes coc selects the
" wrong one. Use this to select the desired interpreter.
nnoremap <leader>pi :CocCommand python.setInterpreter <cr>

"Use tab to cycle forward through auto complete options 
"Use Shift + tab to cycle backwards through auto complete options
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

" Rename symbol under the cursor
nmap <leader>rn <Plug>(coc-rename)

" Work around for coc-python not running isort on save
autocmd BufWrite *.py :CocCommand python.sortImports
