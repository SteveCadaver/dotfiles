
" Required:
call plug#begin("~/.config/nvim/plugged")

" NeoVim Official
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-path'

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
Plug 'nvim-neorg/neorg' 
Plug 'nvim-lua/plenary.nvim'

" Rust-Lang
Plug 'rust-lang/rust.vim'
" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'

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

"******************************************************************************
"" Rust Language Server 
"******************************************************************************


"if executable('rust-analyzer')
"	  #au User lsp_setup call lsp#register_server({
"	#\   'name': 'Rust Language Server',
"	#\   'cmd': {server_info->['rust-analyzer']},
"	#\   'whitelist': ['rust'],
"	#\   'initialization_options': {
"	#\     'cargo': {
"#	\       'buildScripts': {
"#	\         'enable': v:true,
"#	\       },
"#	\     },
"#	\     'procMacro': {
"	\       'enable': v:true,
"	\     },
"	\   },
"	\ })
"endif

"function! s:on_lsp_buffer_enabled() abort
"    #setlocal omnifunc=lsp#complete
"    #setlocal signcolumn=yes
"    #if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
"    #nmap <buffer> gd <plug>(lsp-definition)
"    #nmap <buffer> gs <plug>(lsp-document-symbol-search)
"    #nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
"    #nmap <buffer> gr <plug>(lsp-references)
"    #nmap <buffer> gi <plug>(lsp-implementation)
"    #nmap <buffer> gt <plug>(lsp-type-definition)
"    #nmap <buffer> <leader>rn <plug>(lsp-rename)
"    #nmap <buffer> [g <plug>(lsp-previous-diagnostic)
"    #nmap <buffer> ]g <plug>(lsp-next-diagnostic)
"    #nmap <buffer> K <plug>(lsp-hover)
"    #inoremap <buffer> <expr><c-f> lsp#scroll(+4)
"    #inoremap <buffer> <expr><c-d> lsp#scroll(-4)
"
"    #let g:lsp_format_sync_timeout = 1000
    "autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
"    
"    " refer to doc to add more commands
"endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" Enable Auto-Save for markdown files.
"augroup ft_markdown
"  au!
"  au FileType markdown let b:auto_save = 1
"augroup END
