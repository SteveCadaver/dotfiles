
" Required:
set runtimepath+=~/.config/nvim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" themes
NeoBundle 'joshdick/onedark.vim'

" syntax
NeoBundle 'cespare/vim-toml'

" git 
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'airblade/vim-gitgutter'

" utility
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'bling/vim-airline'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'Chiel92/vim-autoformat'

call neobundle#end()

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

" Nerd Tree
map <C-n> :NERDTreeToggle<CR>

"******************************************************************************
"" Basic Setup
"******************************************************************************

syntax on
" set background=dark
" colorscheme dracula
colorscheme onedark
set number relativenumber
set ruler
set smartindent
set tabstop=3
set shiftwidth=3
set clipboard=unnamed
set mouse=a
highlight LineNr ctermfg=DarkGrey
