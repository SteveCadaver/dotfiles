
" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

Plug 'joshdick/onedark.vim'

call plug#end()

" Split window
nmap sf :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

" Move window
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l

" Switch tab
nmap <S-Tab> :tabprev<Return>
nmap <Tab>   :tabnext<Return>


"******************************************************************************
"" Basic Setup
"******************************************************************************

syntax on
" set background=dark
" colorscheme dracula
colorscheme onedark
set number
set ruler
set smartindent
set tabstop=3
set shiftwidth=3
set clipboard=unnamed
set mouse=a
highlight LineNr ctermfg=DarkGrey
