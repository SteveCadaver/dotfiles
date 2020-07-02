
" Required:
call plug#begin("~/.config/nvim/plugged")

Plug 'joshdick/onedark.vim'
Plug 'dag/vim-fish'

Plug 'cespare/vim-toml'
Plug 'slim-template/vim-slim'

" git 
Plug 'airblade/vim-gitgutter'

" utility
Plug 'christoomey/vim-tmux-navigator'
Plug 'bling/vim-airline'
Plug 'rust-lang/rust.vim'
Plug 'moll/vim-node'

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
" Colourscheme
colorscheme onedark
" Enable current line number and relative line numbers
set number relativenumber
set ruler

" Indent 
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Filetype specific indentation.
au FileType python set shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab
au FileType javascript set shiftwidth=2 tabstop=2 softtabstop=2 noexpandtab

set list

set listchars=trail:·,tab:――⇥,space:⋆
set clipboard=unnamed
set mouse=a
highlight LineNr ctermfg=DarkGrey
"let g:deoplete#enable_at_startup = 1
