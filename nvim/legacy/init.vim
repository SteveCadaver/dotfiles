
" Required:
call plug#begin("~/.config/nvim/plugged")

" NeoVim Official
Plug 'neovim/nvim-lspconfig'

" Autocompletion framework
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-path'

"See hrsh7th other plugins for more great completion sources!
"Snippet engine
Plug 'hrsh7th/vim-vsnip'

" Adds extra functionality over rust analyzer
Plug 'simrat39/rust-tools.nvim'

" Theme and Colour
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'ap/vim-css-color'

Plug 'cespare/vim-toml'
Plug 'slim-template/vim-slim'

" git
Plug 'airblade/vim-gitgutter'

" utility
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'christoomey/vim-tmux-navigator'
Plug 'itchyny/lightline.vim'
Plug 'moll/vim-node'
Plug 'mtdl9/vim-log-highlighting'
Plug 'vimwiki/vimwiki'
Plug '907th/vim-auto-save'

" NeOrg
Plug 'nvim-neorg/neorg' 
Plug 'nvim-lua/plenary.nvim'

" Rust-Lang
Plug 'rust-lang/rust.vim'

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

" Preview Markdown
map <Leader>p :!preview <c-r>%<CR><CR>

" Toggle autocompile
map <Leader>a :!setsid autocomp % &<CR>

"******************************************************************************
"" Basic Setup
"******************************************************************************
"
" Syntax Highlighting
syntax on
" Colourscheme
colorscheme onedark
" colorscheme nord
set tgc

" Line Number Colouring
highlight LineNr ctermfg=DarkGrey guifg=DarkGrey

" Enable current line number and relative line numbers
set number relativenumber
set ruler

" Indent 
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Disable selected -> Use Status line
set noshowmode

" Filetype specific indentation.
au FileType python set shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab
au FileType javascript set shiftwidth=2 tabstop=2 softtabstop=2 noexpandtab

" On file close, the terminal will be cleared.
"au VimLeave * :!clear

set t_ti=""
set list

set listchars=trail:●,tab:\|\ ,space:·
set clipboard=unnamed

" Enable the use of the mouse during all modes.
set mouse=a

let g:lightline = {
	\ 'colorscheme': 'one',
	\ 'background': 'dark',
	\ }

" Enable Auto-Save for markdown files.
"augroup ft_markdown
"  au!
"  au FileType markdown let b:auto_save = 1
"augroup END
